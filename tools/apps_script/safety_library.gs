/**
 * Bibliothèque sécurité (PPSPS + attestation de bon montage)
 *   → safety.json (GitHub francoisvdm2000/mon-app-tech-data)
 *
 * À coller dans Extensions → Apps Script de la feuille
 * « ShowTech Tools – Bibliothèque PPSPS ». Même principe que sound_catalog.gs.
 *
 * Onglets lus (en-têtes de la ligne 1, ne pas les renommer) :
 *   - Catégories : ID, Catégorie (FR), Category (EN), Icône
 *   - Risques    : ID, Catégorie, Risque (FR), Risk (EN), Phases, Gravité, Probabilité, Pays, Actif
 *   - Mesures    : ID, ID risque, Type, Mesure (FR), Measure (EN), Pays, Obligatoire
 *   - Contrôles  : ID, Famille, Point de contrôle (FR), Check (EN), Pays, Photo requise, Actif
 *   - Pays       : Code, Pays, Document, Langues, Références réglementaires, Statut
 *   Colonnes de traduction facultatives : « Catégorie (NL) », « Risque (DE) »,
 *   « Mesure (ES) », « Point de contrôle (PT) »… (langues NL, DE, ES, PT).
 * Une ligne sans ID est ignorée ; un risque ou un contrôle décoché (Actif) aussi,
 * ainsi que les mesures rattachées à un risque inactif.
 *
 * Script properties nécessaires : GITHUB_TOKEN (le même que pour la lumière convient).
 * Les clés de cooldown / hash sont préfixées SAFETY_.
 */

const SAFETY_CFG = {
  owner: 'francoisvdm2000',
  repo: 'mon-app-tech-data',
  path: 'safety.json',
  branch: 'main',
  cooldownMinutes: 15,
  propHash: 'SAFETY_LAST_CATALOG_HASH',
  propRun: 'SAFETY_LAST_PUBLISH_RUN_MS',
};

function safetyStr_(v) {
  return String(v === null || v === undefined ? '' : v).trim();
}

/** Langues supplémentaires lues si la colonne « <libellé> (XX) » existe. */
const SAFETY_EXTRA_LANGS = ['nl', 'de', 'es', 'pt'];

function safetyLangs_(r, prefix, target) {
  SAFETY_EXTRA_LANGS.forEach(l => {
    const v = safetyStr_(r[`${prefix} (${l.toUpperCase()})`]);
    if (v) target[l] = v;
  });
  return target;
}

function safetyInt_(v, def) {
  const n = parseInt(safetyStr_(v), 10);
  return isFinite(n) ? n : def;
}

function safetyBool_(v) {
  if (v === true) return true;
  const s = safetyStr_(v).toLowerCase();
  return ['true', 'vrai', 'oui', 'yes', '1', 'x'].indexOf(s) >= 0;
}

function safetyReadTab_(name) {
  const sheet = SpreadsheetApp.getActive().getSheetByName(name);
  if (!sheet) throw new Error(`Onglet « ${name} » introuvable.`);
  const values = sheet.getDataRange().getValues();
  const headers = values.shift().map(h => String(h).trim());
  return values
    .filter(r => safetyStr_(r[0]) !== '')
    .map(r => {
      const o = {};
      headers.forEach((h, i) => { o[h] = r[i]; });
      return o;
    });
}

function buildSafetyLibraryJson_() {
  const categories = safetyReadTab_('Catégories').map(r => safetyLangs_(r, 'Catégorie', {
    id: safetyStr_(r['ID']),
    fr: safetyStr_(r['Catégorie (FR)']),
    en: safetyStr_(r['Category (EN)']),
    icon: safetyStr_(r['Icône']),
  }));

  const risks = safetyReadTab_('Risques')
    .filter(r => safetyBool_(r['Actif']))
    .map(r => safetyLangs_(r, 'Risque', {
      id: safetyStr_(r['ID']),
      category: safetyStr_(r['Catégorie']),
      fr: safetyStr_(r['Risque (FR)']),
      en: safetyStr_(r['Risk (EN)']),
      phases: safetyStr_(r['Phases']).split(';').map(p => p.trim()).filter(p => p),
      severity: safetyInt_(r['Gravité'], 1),
      probability: safetyInt_(r['Probabilité'], 1),
      country: safetyStr_(r['Pays']) || 'ALL',
    }));
  const riskIds = {};
  risks.forEach(r => { riskIds[r.id] = true; });

  const measures = safetyReadTab_('Mesures')
    .filter(r => riskIds[safetyStr_(r['ID risque'])])
    .map(r => safetyLangs_(r, 'Mesure', {
      id: safetyStr_(r['ID']),
      risk: safetyStr_(r['ID risque']),
      type: safetyStr_(r['Type']),
      fr: safetyStr_(r['Mesure (FR)']),
      en: safetyStr_(r['Measure (EN)']),
      country: safetyStr_(r['Pays']) || 'ALL',
      mandatory: safetyBool_(r['Obligatoire']),
    }));

  const controls = safetyReadTab_('Contrôles')
    .filter(r => safetyBool_(r['Actif']))
    .map(r => safetyLangs_(r, 'Point de contrôle', {
      id: safetyStr_(r['ID']),
      family: safetyStr_(r['Famille']),
      fr: safetyStr_(r['Point de contrôle (FR)']),
      en: safetyStr_(r['Check (EN)']),
      country: safetyStr_(r['Pays']) || 'ALL',
      photoRequired: safetyBool_(r['Photo requise']),
    }));

  const countries = safetyReadTab_('Pays').map(r => ({
    code: safetyStr_(r['Code']),
    name: safetyStr_(r['Pays']),
    document: safetyStr_(r['Document']),
    languages: safetyStr_(r['Langues']).split(',').map(s => s.trim()).filter(s => s),
    references: safetyStr_(r['Références réglementaires']),
    status: safetyStr_(r['Statut']),
  }));

  return { version: 1, categories, risks, measures, controls, countries };
}

/** Test sans publier : Exécuter → voir le journal. */
function previewSafetyLibrary() {
  const c = buildSafetyLibraryJson_();
  Logger.log(`${c.risks.length} risques, ${c.measures.length} mesures, ${c.controls.length} contrôles, ${c.countries.length} pays`);
  Logger.log(JSON.stringify(c, null, 2).slice(0, 4000));
}

function safetyHash_(text) {
  return Utilities.computeDigest(Utilities.DigestAlgorithm.SHA_256, text, Utilities.Charset.UTF_8)
    .map(b => ((b < 0 ? b + 256 : b).toString(16)).padStart(2, '0'))
    .join('');
}

function safetyGithubGet_(api, branch, token) {
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

function publishSafetyToGithub() {
  const lock = LockService.getScriptLock();
  lock.waitLock(30000);
  try {
    const props = PropertiesService.getScriptProperties();
    const token = props.getProperty('GITHUB_TOKEN');
    if (!token) throw new Error('GITHUB_TOKEN manquant (Project Settings → Script properties).');

    const api = `https://api.github.com/repos/${SAFETY_CFG.owner}/${SAFETY_CFG.repo}/contents/${SAFETY_CFG.path}`;
    const nowMs = Date.now();
    const lastRun = Number(props.getProperty(SAFETY_CFG.propRun) || '0');
    if (lastRun > 0 && nowMs - lastRun < SAFETY_CFG.cooldownMinutes * 60 * 1000) {
      Logger.log('Cooldown actif. Publication ignorée.');
      return;
    }

    const base = buildSafetyLibraryJson_();
    const comparableText = JSON.stringify(base);
    const hash = safetyHash_(comparableText);
    if (props.getProperty(SAFETY_CFG.propHash) === hash) {
      Logger.log('Aucun changement local. Appel GitHub ignoré.');
      props.setProperty(SAFETY_CFG.propRun, String(nowMs));
      return;
    }

    const gh = safetyGithubGet_(api, SAFETY_CFG.branch, token);
    if (gh.json) {
      const old = JSON.parse(JSON.stringify(gh.json));
      delete old.updatedAt;
      if (JSON.stringify(old) === comparableText) {
        Logger.log('Identique à GitHub. Mise à jour ignorée.');
        props.setProperty(SAFETY_CFG.propHash, hash);
        props.setProperty(SAFETY_CFG.propRun, String(nowMs));
        return;
      }
    }

    const body = JSON.stringify({ ...base, updatedAt: new Date().toISOString() }, null, 2);
    const payload = {
      message: `update ${SAFETY_CFG.path} ${new Date().toISOString()}`,
      content: Utilities.base64Encode(body, Utilities.Charset.UTF_8),
      branch: SAFETY_CFG.branch,
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

    props.setProperty(SAFETY_CFG.propHash, hash);
    props.setProperty(SAFETY_CFG.propRun, String(nowMs));
    Logger.log('safety.json publié sur GitHub.');
  } finally {
    lock.releaseLock();
  }
}

/** Menu « ShowTech » dans la feuille pour publier à la main. */
function onOpen() {
  SpreadsheetApp.getUi()
    .createMenu('ShowTech')
    .addItem('Aperçu du JSON (journal)', 'previewSafetyLibrary')
    .addItem('Publier safety.json sur GitHub', 'publishSafetyToGithub')
    .addToUi();
}
