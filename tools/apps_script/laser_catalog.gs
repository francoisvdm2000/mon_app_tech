/**
 * Catalogue laser → laser.json (GitHub francoisvdm2000/mon-app-tech-data)
 *
 * À coller dans Extensions → Apps Script de la feuille « Catalogue laser ».
 * Onglet `lasers` :
 *   manufacturer, type, name, powerMw, colors, beamMm, divergenceMrad, scanKpps,
 *   laserClass, dmx, ilda, weightKg, powerW, note, manualUrl
 * dmx / ilda : « Oui » / « Non » (ou yes/no, true/false).
 *
 * Script properties : GITHUB_TOKEN (le même que pour la lumière convient).
 * Clés de cooldown / hash préfixées LASER_ (indépendantes de la lumière et du son).
 */

const LASER_CFG = {
  owner: 'francoisvdm2000',
  repo: 'mon-app-tech-data',
  path: 'laser.json',
  branch: 'main',
  cooldownMinutes: 15,
  propHash: 'LASER_LAST_CATALOG_HASH',
  propRun: 'LASER_LAST_PUBLISH_RUN_MS',
};

function laserNum_(v) {
  const s = String(v === null || v === undefined ? '' : v).trim().replace(',', '.');
  if (s === '') return null;
  const n = Number(s);
  return isFinite(n) && n > 0 ? n : null;
}

function laserStr_(v) {
  return String(v === null || v === undefined ? '' : v).trim();
}

function laserBool_(v) {
  if (v === true) return true;
  const s = laserStr_(v).toLowerCase();
  if (!s) return null;
  return ['oui', 'yes', 'true', '1', 'x'].indexOf(s) >= 0;
}

function buildLaserCatalogJson_() {
  const sheet = SpreadsheetApp.getActive().getSheetByName('lasers');
  if (!sheet) throw new Error('Onglet « lasers » introuvable.');
  const values = sheet.getDataRange().getValues();
  const headers = values.shift().map(h => String(h).trim());

  const manufacturers = {};
  values
    .filter(r => r.some(c => String(c).trim() !== ''))
    .forEach(row => {
      const r = {};
      headers.forEach((h, i) => { r[h] = row[i]; });

      const m = laserStr_(r.manufacturer);
      const name = laserStr_(r.name);
      const powerMw = laserNum_(r.powerMw);
      if (!m || !name || !powerMw) return;

      if (!manufacturers[m]) manufacturers[m] = { name: m, products: [] };
      manufacturers[m].products.push({
        type: laserStr_(r.type),
        name,
        powerMilliwatt: powerMw,
        colors: laserStr_(r.colors),
        beamDiameterMillimeter: laserNum_(r.beamMm),
        divergenceMilliradian: laserNum_(r.divergenceMrad),
        scanKpps: laserStr_(r.scanKpps),
        laserClass: laserStr_(r.laserClass),
        dmx: laserBool_(r.dmx),
        ilda: laserBool_(r.ilda),
        weightKilogram: laserNum_(r.weightKg),
        powerWatt: laserNum_(r.powerW),
        note: laserStr_(r.note),
        manualUrl: laserStr_(r.manualUrl),
      });
    });

  const list = Object.keys(manufacturers)
    .sort((a, b) => a.localeCompare(b))
    .map(k => {
      const mm = manufacturers[k];
      mm.products.sort((a, b) => a.powerMilliwatt - b.powerMilliwatt);
      return mm;
    });

  return { version: 1, manufacturers: list };
}

/** Test sans publier : Exécuter → voir le journal. */
function previewLaserCatalog() {
  const c = buildLaserCatalogJson_();
  const n = c.manufacturers.reduce((s, m) => s + m.products.length, 0);
  Logger.log(`${c.manufacturers.length} marques, ${n} lasers`);
  Logger.log(JSON.stringify(c, null, 2).slice(0, 4000));
}

function laserHash_(text) {
  return Utilities.computeDigest(Utilities.DigestAlgorithm.SHA_256, text, Utilities.Charset.UTF_8)
    .map(b => ((b < 0 ? b + 256 : b).toString(16)).padStart(2, '0'))
    .join('');
}

function laserGithubGet_(api, branch, token) {
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

function publishLaserToGithub() {
  const lock = LockService.getScriptLock();
  lock.waitLock(30000);
  try {
    const props = PropertiesService.getScriptProperties();
    const token = props.getProperty('GITHUB_TOKEN');
    if (!token) throw new Error('GITHUB_TOKEN manquant (Project Settings → Script properties).');

    const api = `https://api.github.com/repos/${LASER_CFG.owner}/${LASER_CFG.repo}/contents/${LASER_CFG.path}`;
    const nowMs = Date.now();
    const lastRun = Number(props.getProperty(LASER_CFG.propRun) || '0');
    if (lastRun > 0 && nowMs - lastRun < LASER_CFG.cooldownMinutes * 60 * 1000) {
      Logger.log('Cooldown actif. Publication ignorée.');
      return;
    }

    const base = buildLaserCatalogJson_();
    const comparableText = JSON.stringify(base);
    const hash = laserHash_(comparableText);
    if (props.getProperty(LASER_CFG.propHash) === hash) {
      Logger.log('Aucun changement local. Appel GitHub ignoré.');
      props.setProperty(LASER_CFG.propRun, String(nowMs));
      return;
    }

    const gh = laserGithubGet_(api, LASER_CFG.branch, token);
    if (gh.json) {
      const old = JSON.parse(JSON.stringify(gh.json));
      delete old.updatedAt;
      if (JSON.stringify(old) === comparableText) {
        Logger.log('Identique à GitHub. Mise à jour ignorée.');
        props.setProperty(LASER_CFG.propHash, hash);
        props.setProperty(LASER_CFG.propRun, String(nowMs));
        return;
      }
    }

    const body = JSON.stringify({ ...base, updatedAt: new Date().toISOString() }, null, 2);
    const payload = {
      message: `update ${LASER_CFG.path} ${new Date().toISOString()}`,
      content: Utilities.base64Encode(body, Utilities.Charset.UTF_8),
      branch: LASER_CFG.branch,
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

    props.setProperty(LASER_CFG.propHash, hash);
    props.setProperty(LASER_CFG.propRun, String(nowMs));
    Logger.log('laser.json publié sur GitHub.');
  } finally {
    lock.releaseLock();
  }
}
