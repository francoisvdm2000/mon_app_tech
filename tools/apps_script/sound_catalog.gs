/**
 * Catalogue son → sound.json (GitHub francoisvdm2000/mon-app-tech-data)
 *
 * À coller dans Extensions → Apps Script de la feuille « Catalogue son ».
 * Même principe que le script de la feuille lumière (fixtures.json) :
 *   - onglet `amps`     : manufacturer, name, channels, zMin, w16, w8, w4, w2_7, w2, note, manualUrl
 *   - onglet `speakers` : manufacturer, type, name, section, zNom, pRms, ampMin, ampMax, note, manualUrl
 *   - colonnes wXX = puissance par voie (W) à XX Ω ; « w2_7 » = 2,7 Ω.
 *     On peut ajouter d'autres colonnes du même format (w6, w3…) : elles sont lues automatiquement.
 *
 * Script properties nécessaires : GITHUB_TOKEN (le même que pour la lumière convient).
 * Les clés de cooldown / hash sont préfixées SOUND_ pour ne pas interférer avec la lumière.
 */

const SOUND_CFG = {
  owner: 'francoisvdm2000',
  repo: 'mon-app-tech-data',
  path: 'sound.json',
  branch: 'main',
  cooldownMinutes: 15,
  propHash: 'SOUND_LAST_CATALOG_HASH',
  propRun: 'SOUND_LAST_PUBLISH_RUN_MS',
};

function soundNum_(v) {
  const s = String(v === null || v === undefined ? '' : v).trim().replace(',', '.');
  if (s === '') return null;
  const n = Number(s);
  return isFinite(n) && n > 0 ? n : null;
}

function soundStr_(v) {
  return String(v === null || v === undefined ? '' : v).trim();
}

function soundReadTab_(name) {
  const sheet = SpreadsheetApp.getActive().getSheetByName(name);
  if (!sheet) throw new Error(`Onglet « ${name} » introuvable.`);
  const values = sheet.getDataRange().getValues();
  const headers = values.shift().map(h => String(h).trim());
  return values
    .filter(r => r.some(c => String(c).trim() !== ''))
    .map(r => {
      const o = {};
      headers.forEach((h, i) => { o[h] = r[i]; });
      return o;
    });
}

function buildSoundCatalogJson_() {
  const manufacturers = {};
  const manu = name => {
    if (!manufacturers[name]) manufacturers[name] = { name, amps: [], speakers: [] };
    return manufacturers[name];
  };

  // ── Amplis ──
  soundReadTab_('amps').forEach(r => {
    const m = soundStr_(r.manufacturer);
    const name = soundStr_(r.name);
    const zMin = soundNum_(r.zMin);
    if (!m || !name || !zMin) return;

    const ratings = [];
    Object.keys(r).forEach(h => {
      const mm = /^w(\d+)(?:_(\d+))?$/.exec(h);
      if (!mm) return;
      const ohm = Number(mm[2] ? `${mm[1]}.${mm[2]}` : mm[1]);
      const watt = soundNum_(r[h]);
      if (watt) ratings.push({ ohm, watt });
    });
    if (!ratings.length) return;
    ratings.sort((a, b) => b.ohm - a.ohm);

    manu(m).amps.push({
      name,
      channels: soundNum_(r.channels) || 1,
      zMinOhm: zMin,
      ratings,
      note: soundStr_(r.note),
      manualUrl: soundStr_(r.manualUrl),
    });
  });

  // ── Enceintes ──
  soundReadTab_('speakers').forEach(r => {
    const m = soundStr_(r.manufacturer);
    const name = soundStr_(r.name);
    const zNom = soundNum_(r.zNom);
    if (!m || !name || !zNom) return;

    manu(m).speakers.push({
      type: soundStr_(r.type),
      name,
      section: soundStr_(r.section),
      zNomOhm: zNom,
      rmsWatt: soundNum_(r.pRms),
      ampMinWatt: soundNum_(r.ampMin),
      ampMaxWatt: soundNum_(r.ampMax),
      note: soundStr_(r.note),
      manualUrl: soundStr_(r.manualUrl),
    });
  });

  // L'ordre des lignes de la feuille est conservé pour les produits
  // (utile pour garder LF avant HF) ; les marques sont triées.
  const list = Object.keys(manufacturers)
    .sort((a, b) => a.localeCompare(b))
    .map(k => manufacturers[k]);

  return { version: 1, manufacturers: list };
}

/** Test sans publier : Exécuter → voir le journal. */
function previewSoundCatalog() {
  const c = buildSoundCatalogJson_();
  const nA = c.manufacturers.reduce((s, m) => s + m.amps.length, 0);
  const nS = c.manufacturers.reduce((s, m) => s + m.speakers.length, 0);
  Logger.log(`${c.manufacturers.length} marques, ${nA} amplis, ${nS} enceintes/sections`);
  Logger.log(JSON.stringify(c, null, 2).slice(0, 4000));
}

function soundHash_(text) {
  return Utilities.computeDigest(Utilities.DigestAlgorithm.SHA_256, text, Utilities.Charset.UTF_8)
    .map(b => ((b < 0 ? b + 256 : b).toString(16)).padStart(2, '0'))
    .join('');
}

function soundGithubGet_(api, branch, token) {
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

function publishSoundToGithub() {
  const lock = LockService.getScriptLock();
  lock.waitLock(30000);
  try {
    const props = PropertiesService.getScriptProperties();
    const token = props.getProperty('GITHUB_TOKEN');
    if (!token) throw new Error('GITHUB_TOKEN manquant (Project Settings → Script properties).');

    const api = `https://api.github.com/repos/${SOUND_CFG.owner}/${SOUND_CFG.repo}/contents/${SOUND_CFG.path}`;
    const nowMs = Date.now();
    const lastRun = Number(props.getProperty(SOUND_CFG.propRun) || '0');
    if (lastRun > 0 && nowMs - lastRun < SOUND_CFG.cooldownMinutes * 60 * 1000) {
      Logger.log('Cooldown actif. Publication ignorée.');
      return;
    }

    const base = buildSoundCatalogJson_();
    const comparableText = JSON.stringify(base);
    const hash = soundHash_(comparableText);
    if (props.getProperty(SOUND_CFG.propHash) === hash) {
      Logger.log('Aucun changement local. Appel GitHub ignoré.');
      props.setProperty(SOUND_CFG.propRun, String(nowMs));
      return;
    }

    const gh = soundGithubGet_(api, SOUND_CFG.branch, token);
    if (gh.json) {
      const old = JSON.parse(JSON.stringify(gh.json));
      delete old.updatedAt;
      if (JSON.stringify(old) === comparableText) {
        Logger.log('Identique à GitHub. Mise à jour ignorée.');
        props.setProperty(SOUND_CFG.propHash, hash);
        props.setProperty(SOUND_CFG.propRun, String(nowMs));
        return;
      }
    }

    const body = JSON.stringify({ ...base, updatedAt: new Date().toISOString() }, null, 2);
    const payload = {
      message: `update ${SOUND_CFG.path} ${new Date().toISOString()}`,
      content: Utilities.base64Encode(body, Utilities.Charset.UTF_8),
      branch: SOUND_CFG.branch,
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

    props.setProperty(SOUND_CFG.propHash, hash);
    props.setProperty(SOUND_CFG.propRun, String(nowMs));
    Logger.log('sound.json publié sur GitHub.');
  } finally {
    lock.releaseLock();
  }
}
