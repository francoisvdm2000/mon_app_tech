/**
 * Catalogue électricité → electricity.json (GitHub francoisvdm2000/mon-app-tech-data)
 *
 * À coller dans Extensions → Apps Script de la feuille « Catalogue électricité ».
 * Même principe que les catalogues son / laser / sécurité.
 *
 *   - onglet `connecteurs` : id, label, short, amps, phases, singleCore, color, section, circuits
 *       id         : identifiant unique, sans espace (ex. cee63, powerlock400)
 *       label      : nom complet affiché (ex. CEE 63A 5P)
 *       short      : nom court sur les pastilles (ex. 63A)
 *       amps       : calibre (A)
 *       phases     : 3 = triphasé, 1 = monophasé
 *       singleCore : oui = câble à conducteurs séparés (Powerlock)
 *       color      : couleur de la pastille, ex. #E5484D (rouge 400 V), #2F80ED (bleu 230 V)
 *       section    : section par défaut du câble (mm²) : 2.5, 6, 16, 35, 95, 150…
 *       circuits   : prises multi (Socapex, Harting…) = nombre de circuits mono
 *                    transportés (6), avec amps = calibre d'un circuit (16).
 *                    Vide ou 1 = prise simple.
 *
 *   - onglet `tableaux` : id, name, input, mainBreaker, note, out_<id connecteur>…
 *       input       : id du connecteur d'entrée (doit exister dans `connecteurs`)
 *       mainBreaker : protection générale (A)
 *       note        : texte libre affiché sous le tableau (optionnel)
 *       out_xxx     : nombre de départs du connecteur `xxx` (ex. out_cee32 = 3).
 *                     Nouveau connecteur ? Ajoute simplement une colonne out_<son id>.
 *                     L'ordre des colonnes = l'ordre des départs dans l'app.
 *
 * Traductions (optionnel) : colonnes label_en, short_de… (connecteurs) et
 * name_en, note_nl… (tableaux). Langues de l'app : en, de, es, nl, pt.
 * Case vide = le texte de base (français) est utilisé.
 *
 * Script properties nécessaires : GITHUB_TOKEN (le même que pour les autres catalogues).
 * Les clés de cooldown / hash sont préfixées ELEC_ pour ne pas interférer.
 *
 * Publication automatique : Déclencheurs → Ajouter → publishElectricityToGithub,
 * « Depuis une feuille de calcul » → « Lors d'une modification ».
 * Publication immédiate : menu ⚡ Catalogue → Publier maintenant.
 */

const ELEC_CFG = {
  owner: 'francoisvdm2000',
  repo: 'mon-app-tech-data',
  path: 'electricity.json',
  branch: 'main',
  cooldownMinutes: 15,
  propHash: 'ELEC_LAST_CATALOG_HASH',
  propRun: 'ELEC_LAST_PUBLISH_RUN_MS',
};

function onOpen() {
  SpreadsheetApp.getUi()
    .createMenu('⚡ Catalogue')
    .addItem('Vérifier (sans publier)', 'previewElectricityCatalog')
    .addItem('Publier maintenant', 'publishElectricityNow')
    .addToUi();
}

function elecNum_(v) {
  const s = String(v === null || v === undefined ? '' : v).trim().replace(',', '.');
  if (s === '') return null;
  const n = Number(s);
  return isFinite(n) && n > 0 ? n : null;
}

function elecStr_(v) {
  return String(v === null || v === undefined ? '' : v).trim();
}

function elecBool_(v) {
  return ['oui', 'yes', 'true', '1', 'x'].indexOf(elecStr_(v).toLowerCase()) >= 0;
}

function elecReadTab_(name) {
  const sheet = SpreadsheetApp.getActive().getSheetByName(name);
  if (!sheet) throw new Error(`Onglet « ${name} » introuvable.`);
  const values = sheet.getDataRange().getValues();
  const headers = values.shift().map(h => String(h).trim());
  return {
    headers,
    rows: values
      .filter(r => r.some(c => String(c).trim() !== ''))
      .map(r => {
        const o = {};
        headers.forEach((h, i) => { o[h] = r[i]; });
        return o;
      }),
  };
}

/** Colonnes traduites (ex. name_en, note_de) → { en: { name: … }, de: { note: … } }. */
function elecI18n_(row, fields) {
  const out = {};
  Object.keys(row).forEach(h => {
    const m = /^([a-z]+)_([a-z]{2})$/.exec(h);
    if (!m || fields.indexOf(m[1]) < 0) return;
    const v = elecStr_(row[h]);
    if (!v) return;
    (out[m[2]] = out[m[2]] || {})[m[1]] = v;
  });
  return Object.keys(out).length ? out : undefined;
}

function buildElectricityCatalogJson_() {
  const warnings = [];

  // ── Connecteurs ──
  const connectors = [];
  const ids = {};
  elecReadTab_('connecteurs').rows.forEach((r, i) => {
    const id = elecStr_(r.id);
    const amps = elecNum_(r.amps);
    if (!id || !amps) { warnings.push(`connecteurs ligne ${i + 2} ignorée (id ou amps manquant)`); return; }
    if (ids[id]) { warnings.push(`connecteur « ${id} » en double`); return; }
    ids[id] = true;
    const phases = elecNum_(r.phases) === 1 ? 1 : 3;
    let color = elecStr_(r.color);
    if (color && color[0] !== '#') color = '#' + color;
    connectors.push({
      id,
      label: elecStr_(r.label) || id,
      short: elecStr_(r.short) || elecStr_(r.label) || id,
      amps,
      phases,
      singleCore: elecBool_(r.singleCore),
      color: color || (phases === 1 ? '#2F80ED' : '#E5484D'),
      section: elecNum_(r.section),
      circuits: Math.max(1, Math.round(elecNum_(r.circuits) || 1)),
      i18n: elecI18n_(r, ['label', 'short']),
    });
  });

  // ── Tableaux ──
  const distros = [];
  const tab = elecReadTab_('tableaux');
  const outCols = tab.headers.filter(h => /^out_/.test(h));
  outCols.forEach(h => {
    if (!ids[h.slice(4)]) warnings.push(`colonne ${h} : connecteur « ${h.slice(4)} » inconnu`);
  });
  tab.rows.forEach((r, i) => {
    const name = elecStr_(r.name);
    const input = elecStr_(r.input);
    if (!name) return;
    if (!ids[input]) { warnings.push(`tableau « ${name} » : entrée « ${input} » inconnue`); return; }
    const outputs = [];
    outCols.forEach(h => {
      const id = h.slice(4);
      const n = elecNum_(r[h]);
      if (ids[id] && n) outputs.push({ connector: id, count: Math.round(n) });
    });
    distros.push({
      id: elecStr_(r.id) || `row${i + 2}`,
      name,
      input,
      mainBreaker: elecNum_(r.mainBreaker),
      note: elecStr_(r.note),
      outputs,
      i18n: elecI18n_(r, ['name', 'note']),
    });
  });

  return { json: { version: 1, connectors, distros }, warnings };
}

/** Test sans publier : affiche le résultat et les éventuelles erreurs. */
function previewElectricityCatalog() {
  const { json, warnings } = buildElectricityCatalogJson_();
  const msg = `${json.connectors.length} connecteurs, ${json.distros.length} tableaux.` +
    (warnings.length ? `\n\n⚠️ À corriger :\n- ${warnings.join('\n- ')}` : '\n\n✅ Tout est bon.');
  Logger.log(msg);
  Logger.log(JSON.stringify(json, null, 2).slice(0, 4000));
  try { SpreadsheetApp.getUi().alert(msg); } catch (e) { /* exécution sans interface */ }
}

/** Publication manuelle : ignore le délai de 15 minutes. */
function publishElectricityNow() {
  PropertiesService.getScriptProperties().deleteProperty(ELEC_CFG.propRun);
  publishElectricityToGithub();
  try { SpreadsheetApp.getActive().toast('Catalogue publié (ou déjà à jour).', '⚡ Catalogue'); } catch (e) {}
}

function elecHash_(text) {
  return Utilities.computeDigest(Utilities.DigestAlgorithm.SHA_256, text, Utilities.Charset.UTF_8)
    .map(b => ((b < 0 ? b + 256 : b).toString(16)).padStart(2, '0'))
    .join('');
}

function elecGithubGet_(api, branch, token) {
  const res = UrlFetchApp.fetch(`${api}?ref=${branch}`, {
    method: 'get',
    muteHttpExceptions: true,
    headers: { Authorization: `token ${token}`, Accept: 'application/vnd.github+json' },
  });
  const code = res.getResponseCode();
  if (code === 200) {
    const json = JSON.parse(res.getContentText());
    const decoded = Utilities.newBlob(Utilities.base64Decode(json.content.replace(/\n/g, '')))
      .getDataAsString('UTF-8');
    return { sha: json.sha, json: JSON.parse(decoded) };
  }
  if (code === 404) return { sha: null, json: null };
  throw new Error(`GitHub GET failed: ${code} ${res.getContentText()}`);
}

function publishElectricityToGithub() {
  const lock = LockService.getScriptLock();
  lock.waitLock(30000);
  try {
    const props = PropertiesService.getScriptProperties();
    const token = props.getProperty('GITHUB_TOKEN');
    if (!token) throw new Error('GITHUB_TOKEN manquant (Project Settings → Script properties).');

    const api = `https://api.github.com/repos/${ELEC_CFG.owner}/${ELEC_CFG.repo}/contents/${ELEC_CFG.path}`;
    const nowMs = Date.now();
    const lastRun = Number(props.getProperty(ELEC_CFG.propRun) || '0');
    if (lastRun > 0 && nowMs - lastRun < ELEC_CFG.cooldownMinutes * 60 * 1000) {
      Logger.log('Cooldown actif. Publication ignorée.');
      return;
    }

    const base = buildElectricityCatalogJson_().json;
    if (!base.connectors.length) throw new Error('Aucun connecteur valide : publication annulée.');
    const comparableText = JSON.stringify(base);
    const hash = elecHash_(comparableText);
    if (props.getProperty(ELEC_CFG.propHash) === hash) {
      Logger.log('Aucun changement local. Appel GitHub ignoré.');
      props.setProperty(ELEC_CFG.propRun, String(nowMs));
      return;
    }

    const gh = elecGithubGet_(api, ELEC_CFG.branch, token);
    if (gh.json) {
      const old = JSON.parse(JSON.stringify(gh.json));
      delete old.updatedAt;
      if (JSON.stringify(old) === comparableText) {
        Logger.log('Identique à GitHub. Mise à jour ignorée.');
        props.setProperty(ELEC_CFG.propHash, hash);
        props.setProperty(ELEC_CFG.propRun, String(nowMs));
        return;
      }
    }

    const body = JSON.stringify({ ...base, updatedAt: new Date().toISOString() }, null, 2);
    const payload = {
      message: `update ${ELEC_CFG.path} ${new Date().toISOString()}`,
      content: Utilities.base64Encode(body, Utilities.Charset.UTF_8),
      branch: ELEC_CFG.branch,
    };
    if (gh.sha) payload.sha = gh.sha;

    const put = UrlFetchApp.fetch(api, {
      method: 'put',
      contentType: 'application/json',
      payload: JSON.stringify(payload),
      muteHttpExceptions: true,
      headers: { Authorization: `token ${token}`, Accept: 'application/vnd.github+json' },
    });
    if (put.getResponseCode() >= 300) {
      throw new Error(`GitHub publish failed: ${put.getResponseCode()} ${put.getContentText()}`);
    }

    props.setProperty(ELEC_CFG.propHash, hash);
    props.setProperty(ELEC_CFG.propRun, String(nowMs));
    Logger.log('electricity.json publié sur GitHub.');
  } finally {
    lock.releaseLock();
  }
}
