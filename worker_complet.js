// ============================================================================
//  Worker Cloudflare — STAGING v2 (multi-instance + parallélisation des modes)
//
//  Pour déployer dans un Worker séparé (ex: showtech-gdtf-staging) tant qu'on
//  n'a pas validé. Ne PAS écraser le Worker de prod.
//
//  Stratégie : on remplace l'unique appel GPT-4o (lent, parfois tronqué) par
//  une chaîne en 2 étapes parallélisable :
//    Étape 1 — Mode discovery : un petit appel (~2 s) qui liste juste les
//              modes DMX présents dans le manuel (nom + nombre de canaux).
//    Étape 2 — Channel extraction : pour CHAQUE mode trouvé, un appel
//              indépendant qui extrait UNIQUEMENT les canaux de CE mode.
//              Tous lancés en parallèle via Promise.all.
//
//  Avantages :
//    - Plus rapide (~5-10 s total au lieu de 60-90 s).
//    - Plus jamais tronqué : chaque appel produit ~2-3K tokens, très en
//      dessous du plafond.
//    - Plus précis : focalisation prompt « extrais SEULEMENT ce mode-là ».
//    - On peut utiliser gpt-4o-mini, 4x plus rapide et ~30x moins cher.
//
//  Le multi-column parser (Robe SPIIDER, première ligne "dmx protocol") est
//  inchangé — il ne va pas par l'IA, il marche déjà bien.
// ============================================================================

const OPENAI_URL = 'https://api.openai.com/v1/chat/completions';
// Modèles :
//   - Discovery : gpt-4o-mini. ~4x plus rapide que gpt-4o. Suffit largement
//     maintenant que le prompt utilise des placeholders au lieu d'exemples
//     concrets (plus de risque de "copie" depuis un fixture précédent).
//     Sur Astera Titan (143 modes) on passe d'une discovery >2min à ~30-45s.
//   - Extraction : gpt-4o (v20). gpt-4o-mini perdait des canaux sur les
//     tableaux à structure non-conventionnelle (texte vertical inversé du
//     mode 10 StickKolor, abréviations symboliques du mode 72, etc.).
//     gpt-4o lit ces structures correctement (cf. le worker prod qui
//     produisait le StickKolor-3 référence avec un seul appel gpt-4o).
//     Le retry vers gpt-4o reste configuré (texte réduit à 80K) au cas
//     où l'appel 1 dépasse le TPM bucket OpenAI.
const MODEL_DISCOVERY = 'gpt-4o-mini';
const MODEL_EXTRACTION = 'gpt-4o';
const TEMPERATURE = 0.0;             // tout déterministe
// Limites différentes pour discovery vs extraction :
//   - Discovery : a besoin de la TOC + intro. ~50K chars suffisent largement
//     et la réponse reste rapide (~20-30s même sur 143 modes).
//   - Extraction : a besoin de voir la table DMX du mode demandé, qui peut
//     être très loin dans le manuel (Titan p.50+). On laisse 150K chars.
//   - Extraction retry sur gpt-4o : tier OpenAI bas plafonne gpt-4o à 30K
//     TPM. On limite donc l'input à ~80K chars (~20K tokens) pour que
//     input + output reste sous la limite.
const MAX_INPUT_CHARS_DISCOVERY = 50000;
const MAX_INPUT_CHARS_EXTRACT = 150000;
const MAX_INPUT_CHARS_EXTRACT_GPT4O_RETRY = 80000;
const CALL_TIMEOUT_MS = 180000;      // 180s max (aligné sur timeout Flutter).
const MAX_RETRIES_PER_MODE = 2;      // 2 retries max : retry mini, puis gpt-4o.

// ── GDTF Share search & download ─────────────────────────────────────────────
const GDTF_API      = 'https://gdtf-share.com/apis/public';
const GDTF_USER     = 'francoisvdm2000';
const GDTF_PASSWORD = 'fvdm4632';

let _gdtfListCache    = null;
let _gdtfListCachedAt = 0;
const LIST_TTL_MS     = 10 * 60 * 1000; // 10 min

async function gdtfLogin() {
  const res = await fetch(`${GDTF_API}/login.php`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ user: GDTF_USER, password: GDTF_PASSWORD }),
    redirect: 'manual',
  });
  const raw    = res.headers.get('set-cookie') ?? '';
  const cookie = raw.split(';')[0].trim();
  if (!cookie) throw new Error('Login GDTF Share échoué — vérifie les identifiants.');
  return cookie;
}

async function gdtfGetList() {
  const now = Date.now();
  if (_gdtfListCache && now - _gdtfListCachedAt < LIST_TTL_MS) return _gdtfListCache;
  const cookie = await gdtfLogin();
  const res    = await fetch(`${GDTF_API}/getList.php`, { headers: { Cookie: cookie } });
  if (!res.ok) throw new Error(`getList HTTP ${res.status}`);
  const data = await res.json();
  if (!data.result) throw new Error(data.error ?? 'getList: result=false');
  _gdtfListCache    = data.list ?? [];
  _gdtfListCachedAt = now;
  return _gdtfListCache;
}

async function gdtfSearch(url, corsHeaders) {
  const q = (url.searchParams.get('q') ?? '').trim().toLowerCase();
  if (!q) return new Response(JSON.stringify({ results: [] }),
    { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } });
  try {
    const list  = await gdtfGetList();
    const terms = q.split(/\s+/);
    const hits  = list.filter(f => {
      const hay = `${f.manufacturer} ${f.fixture}`.toLowerCase();
      return terms.every(t => hay.includes(t));
    });
    return new Response(JSON.stringify({ results: hits.slice(0, 50) }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } });
  } catch (err) {
    return new Response(JSON.stringify({ error: err.message }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } });
  }
}

async function gdtfDownload(url, corsHeaders) {
  const rid = url.searchParams.get('rid');
  if (!rid) return new Response(JSON.stringify({ error: 'Paramètre rid manquant' }),
    { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } });
  try {
    const cookie = await gdtfLogin();
    const res    = await fetch(`${GDTF_API}/downloadFile.php?rid=${encodeURIComponent(rid)}`,
      { headers: { Cookie: cookie } });
    if (!res.ok) {
      const msg = await res.text().catch(() => `HTTP ${res.status}`);
      return new Response(msg, { status: res.status, headers: corsHeaders });
    }
    return new Response(res.body, {
      status: 200,
      headers: {
        ...corsHeaders,
        'Content-Type': 'application/octet-stream',
        'Content-Disposition': `attachment; filename="fixture_${rid}.gdtf"`,
      },
    });
  } catch (err) {
    return new Response(JSON.stringify({ error: err.message }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } });
  }
}
// ─────────────────────────────────────────────────────────────────────────────

export default {
  async fetch(request, env, ctx) {
    const corsHeaders = {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type',
    };
    if (request.method === 'OPTIONS') return new Response(null, { headers: corsHeaders });

    // ── Routes GET : GDTF Share search & download ────────────────────────────
    const url = new URL(request.url);
    if (request.method === 'GET') {
      if (url.pathname === '/search')   return gdtfSearch(url, corsHeaders);
      if (url.pathname === '/download') return gdtfDownload(url, corsHeaders);
      return jsonErr(corsHeaders, 404, 'Route inconnue');
    }

    if (request.method !== 'POST') return jsonErr(corsHeaders, 405, 'Méthode non autorisée');

    let body;
    try { body = await request.json(); } catch {
      return jsonErr(corsHeaders, 400, 'Body JSON invalide');
    }
    const { fixture_name, manufacturer, pdf_text, pdf_base64, action, selected_modes } = body;
    if (!fixture_name || !manufacturer) {
      return jsonErr(corsHeaders, 400, 'Paramètres manquants');
    }
    // pdf_text peut être vide pour les PDF scannés : le microservice OCR
    // (table-extractor v1.1) reconstruira le texte depuis les images en
    // appliquant Tesseract. On exige juste pdf_base64 dans ce cas.
    if (!pdf_text && !pdf_base64) {
      return jsonErr(corsHeaders, 400,
          'Paramètres manquants: au moins pdf_text ou pdf_base64 requis');
    }

    // ─── Récupération du texte tabulaire via le microservice ──────────────
    // Si pdf_base64 fourni ET TABLE_EXTRACTOR_URL configurée, on demande au
    // microservice de reconstituer le texte tabulaire des pages protocole DMX.
    // Sur les manuels avec de vraies tables (Cobra, Viper, 350BWS, Spiider,
    // Titan, JDC1, X4 Bar), ce texte est BEAUCOUP plus exploitable par l'IA
    // que le texte plat. Si le microservice ne renvoie rien (manuel sans
    // bordures comme Helix/StickKolor, ou microservice down), on garde le
    // texte plat comme fallback.
    // Normalisation : pdf_text peut être '' ou undefined (PDF scanné).
    // On garde un string vide partout pour éviter les "undefined" injectés
    // dans les templates literals ou les .substring() qui crashent.
    const safePdfText = (typeof pdf_text === 'string' && pdf_text) ? pdf_text : '';
    let augmentedText = safePdfText;
    let tabularPages = [];
    let detectedModes = [];  // [{label, expanded_name, channels}, ...]
    let ocrUsed = false;
    let microserviceError = null;  // Pour le debug client (Flutter le log).
    // Marker injecté quand le texte vient du microservice (pdfplumber ou OCR
    // Tesseract). Si l'app nous renvoie un pdf_text qui commence par ce
    // marker, c'est qu'il vient d'un discover précédent — pas la peine de
    // re-faire l'appel au microservice (économise 5-120s selon OCR ou non).
    // Couvre le cas Clay Paky (OCR) ET le cas Syncfusion qui retourne 0 char
    // sur certains PDF où pdfplumber, lui, trouve les tables.
    const WORKER_TEXT_MARKER = '========== WORKER EXTRACTED TEXT ==========';
    const isCachedWorkerText = safePdfText.startsWith(WORKER_TEXT_MARKER);
    // Debug : si TABLE_EXTRACTOR_URL n'est pas configurée, on rate
    // silencieusement l'OCR. On le remonte dans microservice_error.
    if (pdf_base64 && !env.TABLE_EXTRACTOR_URL) {
      microserviceError = 'TABLE_EXTRACTOR_URL non configurée dans wrangler.toml/env';
    }
    if (pdf_base64 && env.TABLE_EXTRACTOR_URL && !isCachedWorkerText) {
      try {
        const tx = await fetchTabularText(pdf_base64, env.TABLE_EXTRACTOR_URL);
        if (tx && tx.tabular_text) {
          // On PREFIXE le texte tabulaire au pdf_text. Comme ça, l'IA voit
          // d'abord les tables propres, mais garde aussi le contexte prose
          // pour la discovery (page 13 du Viper, etc.).
          // Si safePdfText est vide (Syncfusion local a échoué OU PDF scanné),
          // on injecte juste le texte du microservice avec le marker WORKER.
          augmentedText = safePdfText
            ? `========== TABULAR PROTOCOL TABLES ==========\n${tx.tabular_text}\n\n========== ORIGINAL PDF TEXT ==========\n${safePdfText}`
            : `${WORKER_TEXT_MARKER}\n${tx.tabular_text}`;
          tabularPages = tx.pages || [];
          ocrUsed = !!tx.ocr_used;
        }
        // detected_modes = comptage déterministe par colonne (cas Cobra,
        // 350BWS où chaque mode est une colonne). Va overrider la
        // discovery IA pour ces fixtures.
        if (Array.isArray(tx?.detected_modes) && tx.detected_modes.length > 0) {
          detectedModes = tx.detected_modes;
        }
      } catch (e) {
        // Microservice down ou timeout — on log ET on remonte l'erreur dans
        // la réponse JSON pour que le client (Flutter) puisse l'afficher au
        // dev. Sans ça, l'IA hallucine des modes silencieusement.
        microserviceError = e.message || String(e);
        console.log('Table extractor unavailable:', microserviceError);
      }
    }

    // Deux versions du texte selon ce qu'on en fait :
    //  - discoveryText : pdf_text BRUT (pas augmenté). La TOC est au début
    //    du manuel — le tabular_text du microservice ne sert pas pour compter
    //    les modes, et préfixer ses ~24K chars chassait la TOC du Titan
    //    hors de la fenêtre 50K (régression v20 : 102 modes au lieu de 143).
    //  - extractText : augmentedText (tabular + pdf). L'IA a besoin de voir
    //    les tables structurées du microservice pour extraire correctement
    //    les canaux du mode demandé (Cobra, 350BWS via detected_modes).
    // Discovery : si on est sur un PDF scanné (safePdfText vide), on prend
    // le texte OCR à la place pour que la discovery puisse aussi marcher.
    const discoveryText = (safePdfText || augmentedText)
        .substring(0, MAX_INPUT_CHARS_DISCOVERY);
    const extractText = augmentedText.substring(0, MAX_INPUT_CHARS_EXTRACT);

    // ─── Routing par action ───────────────────────────────────────────────
    // - action === "discover" : renvoie SEULEMENT la liste des modes.
    //                           Permet à l'app d'afficher une UI de sélection
    //                           avant de payer l'extraction des canaux.
    // - action === "extract"  : prend `selected_modes` du body, skip la
    //                           discovery, lance directement l'extraction des
    //                           modes choisis.
    // - sinon (rétro-compat)  : ancien comportement = discovery + extraction
    //                           de tous les modes trouvés.

    // Le multi-column parser (Robe SPIIDER, "dmx protocol") n'est utilisé que
    // pour les requêtes "full" (rétro-compat). Pour discover/extract on passe
    // toujours par l'IA — ça reste rapide et homogène.
    if (action !== 'discover' && action !== 'extract') {
      const firstLine = discoveryText.split('\n').map(l => l.trim()).find(l => l.length > 0) || '';
      const isPureDmxChart = firstLine.toLowerCase() === 'dmx protocol';
      const directXml = isPureDmxChart ? tryParseMultiColumnToXml(discoveryText) : null;
      if (directXml && directXml.includes('<Mode>')) {
        return new Response(JSON.stringify({ success: true, xml: directXml }), {
          status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' }
        });
      }
    }

    // ─── Branche DISCOVER ────────────────────────────────────────────────
    if (action === 'discover') {
      let modeList;
      try {
        modeList = await discoverModes(discoveryText, manufacturer, fixture_name, env);
      } catch (e) {
        return jsonErr(corsHeaders, 502, 'Erreur mode discovery: ' + (e.message || String(e)));
      }
      // PAS d'erreur si 0 mode. On retourne success avec liste vide — Flutter
      // proposera la saisie manuelle. Indispensable pour les PDF où l'IA
      // refuse de deviner (Clay Paky B-Eye OCR multi-colonnes, etc.). Tant
      // qu'on a augmentedText à renvoyer (ocr_text), l'extract pourra ensuite
      // tirer les canaux pour chaque mode saisi à la main.
      if (!modeList) modeList = [];
      // Override déterministe via detected_modes : si le microservice a
      // compté les channels par colonne (Cobra, 350BWS), on aligne les
      // comptes IA sur ces valeurs (fuzzy match par nom). C'est plus fiable
      // que la devinette IA — on a mesuré, on n'estime pas.
      modeList = applyDetectedModesOverride(modeList, detectedModes);
      // Si l'app n'avait pas réussi à extraire localement (safePdfText vide)
      // mais que le worker a trouvé du texte via le microservice (pdfplumber
      // ou OCR), on renvoie ce texte à l'app pour qu'elle le cache et le
      // réutilise dans /extract. Le marker WORKER_TEXT_MARKER permet au
      // worker de skip le 2e appel microservice. Cas couverts :
      //  - PDF scanné (Clay Paky B-Eye) → OCR Tesseract dans augmentedText
      //  - PDF où Syncfusion (lib Flutter) retourne 0 char alors que
      //    pdfplumber côté worker arrive à lire les tables
      // Champ omis (undefined → strippé par JSON.stringify) sinon.
      const workerExtractedText =
          (!safePdfText && augmentedText) ? augmentedText : undefined;
      return new Response(JSON.stringify({
        success: true,
        modes: modeList,                  // [{name, channels}, ...]
        discovered_count: modeList.length,
        // Compat ascendante : on garde le champ ocr_text pour l'ancien client
        // Flutter qui ne lirait que ce champ-là.
        ocr_text: workerExtractedText,
        worker_extracted_text: workerExtractedText,
        ocr_used: ocrUsed,
        microservice_error: microserviceError,  // null si OK
        _worker_version: 'staging-2026-05-20-v28-empty-left-cell-rule',
      }), {
        status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' }
      });
    }

    // ─── Branche EXTRACT ─────────────────────────────────────────────────
    let modeList;
    if (action === 'extract') {
      if (!Array.isArray(selected_modes) || selected_modes.length === 0) {
        return jsonErr(corsHeaders, 400, 'action=extract requiert selected_modes (array non vide)');
      }
      // Validation rapide de la forme.
      modeList = selected_modes.filter(m =>
        m && typeof m.name === 'string' && Number.isInteger(m.channels) && m.channels > 0);
      if (modeList.length === 0) {
        return jsonErr(corsHeaders, 400, 'selected_modes invalide (besoin de {name, channels})');
      }
    } else {
      // Rétro-compat : pas d'action → discovery automatique + extraction de tout.
      try {
        modeList = await discoverModes(discoveryText, manufacturer, fixture_name, env);
      } catch (e) {
        return jsonErr(corsHeaders, 502, 'Erreur mode discovery: ' + (e.message || String(e)));
      }
      if (!modeList || modeList.length === 0) {
        return jsonErr(corsHeaders, 502, 'Aucun mode DMX trouvé dans le manuel');
      }
    }

    // Channel extraction par batchs de EXTRACT_CONCURRENCY modes, avec retry
    // par mode. On utilise extractText (150K chars) pour que chaque appel ait
    // la vraie table DMX du mode demandé, même si elle est loin dans le manuel.
    //
    // Pourquoi des batchs et pas Promise.all global ? Le tier 1 OpenAI a une
    // limite TPM (~30K-450K selon modèle). Avec 5-7 modes à 150K chars
    // (~37K tokens) en parallèle, on dépasse facilement en 1s → HTTP 429.
    // Batch de 2 + 1.5s de pause entre batchs étale la charge, évite 429
    // tout en restant rapide.
    // v20 : 3→2 concurrency + 500ms→1500ms après échecs ColorStrike-M
    // (30CH + 47CH KO sur 8 modes) et LEDbar Pro (47ch KO sur 7 modes).
    const EXTRACT_CONCURRENCY = 2;
    const INTER_BATCH_DELAY_MS = 1500;
    const results = [];
    for (let i = 0; i < modeList.length; i += EXTRACT_CONCURRENCY) {
      const batch = modeList.slice(i, i + EXTRACT_CONCURRENCY);
      const batchResults = await Promise.all(
        batch.map(mode => extractWithRetry(mode, extractText, manufacturer, fixture_name, env, detectedModes, pdf_text))
      );
      results.push(...batchResults);
      if (i + EXTRACT_CONCURRENCY < modeList.length) {
        await new Promise(r => setTimeout(r, INTER_BATCH_DELAY_MS));
      }
    }

    const validXmls = [];
    const errors = [];
    for (const r of results) {
      if (typeof r.xml === 'string' && r.xml.includes('<Mode>')) {
        validXmls.push(r.xml);
      } else {
        errors.push({ mode: r.mode.name, channels: r.mode.channels, error: r.error });
      }
    }

    if (validXmls.length === 0) {
      return jsonErr(corsHeaders, 502, 'Aucun mode extrait correctement', { errors });
    }

    const xml = '<Modes>\n' + validXmls.join('\n') + '\n</Modes>';
    return new Response(JSON.stringify({
      success: true,
      xml,
      discovered_count: modeList.length,
      extracted_count: validXmls.length,
      warnings: errors.length > 0 ? errors : undefined,
    }), {
      status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' }
    });
  }
};

// ────────────────────────────────────────────────────────────────────────────
//  Étape 1 — Mode discovery
//  Petit appel qui demande SEULEMENT la liste des modes (nom + nb canaux).
//  ~200-500 tokens en sortie, ~2 s.
// ────────────────────────────────────────────────────────────────────────────
async function discoverModes(manualText, manufacturer, fixtureName, env) {
  // Premier essai — prompt complet.
  let result = await discoverModesOnce(manualText, manufacturer, fixtureName, env, /*retry=*/ false);

  // Conditions pour retry :
  //   - le manuel déclare un total (declared_count) supérieur à ce qu'on a,
  //   - ET on a moins de 50 modes (sinon catalogue déjà ample → retry coûte
  //     plus qu'il ne rapporte, et risque timeout sur des manuels Titan-style),
  //   - ET on a au moins 1 mode (sinon la première extraction a vraiment foiré).
  // Sans cette garde, sur le Titan (143 déclarés / 126 trouvés) on relançait
  // une seconde fois et on touchait le timeout total.
  const shouldRetry = result.declared
      && result.modes.length < result.declared
      && result.modes.length > 0
      && result.modes.length < 50;
  if (shouldRetry) {
    const second = await discoverModesOnce(manualText, manufacturer, fixtureName, env, /*retry=*/ true,
      { missing: result.declared - result.modes.length, alreadyFound: result.modes });
    if (second.modes.length > result.modes.length) result = second;
  }

  // OVERRIDE locale : on cherche dans le texte du manuel les phrases prose
  // type "requiert N canaux DMX en mode <nom>" / "requires N DMX channels in
  // <name> mode". Si on trouve une correspondance ferme, on écrase le compte
  // retourné par l'IA. Cas Viper : le manuel dit explicitement "26 canaux DMX
  // en mode basique 16 bits" mais l'IA renvoyait parfois 34. Avec cet override,
  // on garantit la valeur prose autoritaire du manuel.
  result.modes = applyProseChannelCounts(manualText, result.modes);

  // BLACKLIST : filtre les "modes" hallucinés qui sont en fait des labels
  // de ChannelSet appearant dans le tableau de protocole. L'IA confond
  // souvent "Prism Mode Simple/Full", "Spot Mode", "Beam Mode" — qui sont
  // des LIBELLÉS de plages DMX sur le canal Control — avec de vrais modes.
  // On les vire pour éviter qu'ils encombrent l'écran de sélection.
  result.modes = result.modes.filter(m => !isFalseModeName(m.name));

  return result.modes;
}

// Détecte un nom qui ressemble à un label de ChannelSet et non à un vrai mode.
// Critères :
//   - Contient "Prism Mode" / "Spot Mode" / "Beam Mode" / "Special Mode"
//     (ces phrases sont 99% des plages DMX dans des canaux de prisme/control)
//   - Contient "Motor Reset" / "All Motor Reset" / "Reset"
//   - Très court (1-3 caractères) — probablement une abbréviation mal lue
function isFalseModeName(name) {
  const lower = (name || '').toLowerCase().trim();
  if (!lower) return true;
  const blacklist = [
    /prism\s+mode\s+(simple|full|hard|soft)/,
    /\b(spot|beam|wash|special)\s+mode\b/,
    /\ball\s+motor\s+reset\b/,
    /\bmotor\s+reset\b/,
    /^(reset|on|off|open|closed)$/,
  ];
  return blacklist.some(re => re.test(lower));
}

// Cherche dans le texte manuel les patterns "N canaux/channels ... mode X" et
// "X mode ... requires N channels", puis corrige les comptes des modes.
function applyProseChannelCounts(manualText, modes) {
  if (!Array.isArray(modes) || modes.length === 0) return modes;

  // Patterns supportés (case-insensitive, accents tolérés via \\w*) :
  //   "requiert N canaux DMX en mode <name>"
  //   "requires N DMX channels in <name> mode"
  //   "<name> mode requires N DMX channels"
  //   "<name> requires N DMX channels"
  // On capture N et un fragment de nom autour pour matcher ensuite avec les
  // modes connus par fuzzy match (insensible casse / accents / "Mode" prefix).
  // Patterns avec lookahead pour stopper le nom du mode sur " et N canaux ",
  // virgule, point, ou fin de ligne. Sans ça la capture déborde sur le 2ème
  // mode (cas Viper : "requiert 26 ... mode basique 16 bits et 34 ... mode
  // 16 bits étendu" → 1er match capturerait toute la fin).
  const stopName = '(?=\\s+et\\s+\\d|\\s*[.,;\\n]|$)';
  const patterns = [
    // "requiert N canaux DMX en mode <nom>"
    new RegExp(`(?:requiert|requires?)\\s+(\\d{1,3})\\s+canaux\\s+DMX\\s+en\\s+mode\\s+(.{2,80}?)${stopName}`, 'gi'),
    // "et N canaux DMX en mode <nom>" — pour le 2ème mode dans la même phrase
    new RegExp(`\\bet\\s+(\\d{1,3})\\s+canaux\\s+DMX\\s+en\\s+mode\\s+(.{2,80}?)${stopName}`, 'gi'),
    // EN — "requires N DMX channels in <nom> mode"
    new RegExp(`(?:requires|requiert)\\s+(\\d{1,3})\\s+(?:DMX\\s+)?channels?\\s+in\\s+(.{2,80}?)\\s+mode${stopName}`, 'gi'),
    // EN — "<nom> mode requires N DMX channels"
    new RegExp(`([^\\n.,]{2,80}?)\\s+mode\\s+(?:requires|requiert)\\s+(\\d{1,3})\\s+(?:DMX\\s+)?channels?`, 'gi'),
  ];

  // Collecte des correspondances : [{ name: fragment, channels: N }]
  // Patterns 0/1/2 : ordre (N, name). Pattern 3 : ordre (name, N).
  const hits = [];
  for (let i = 0; i < patterns.length; i++) {
    const re = patterns[i];
    re.lastIndex = 0;
    let m;
    while ((m = re.exec(manualText)) !== null) {
      let n, frag;
      if (i === 3) {
        // "<nom> mode requires N channels"
        frag = m[1];
        n = parseInt(m[2], 10);
      } else {
        n = parseInt(m[1], 10);
        frag = m[2];
      }
      if (Number.isInteger(n) && n > 0 && n < 1024 && frag) {
        hits.push({ name: frag.trim().toLowerCase(), channels: n });
      }
    }
  }

  if (hits.length === 0) return modes;

  // Normalise pour fuzzy match : minuscules, sans accents, sans "mode".
  function normalize(s) {
    return s
      .toLowerCase()
      .normalize('NFD').replace(/[̀-ͯ]/g, '') // strip accents
      .replace(/\bmode\b/g, '')
      .replace(/[^a-z0-9]+/g, ' ')
      .trim();
  }

  // Pour chaque mode : on cherche le hit qui matche le mieux son nom.
  return modes.map(mode => {
    const modeNorm = normalize(mode.name);
    let bestHit = null;
    let bestScore = 0;
    for (const hit of hits) {
      const hitNorm = normalize(hit.name);
      // Score : nombre de tokens partagés (intersection des mots).
      const modeTokens = new Set(modeNorm.split(' ').filter(t => t.length > 1));
      const hitTokens = new Set(hitNorm.split(' ').filter(t => t.length > 1));
      let shared = 0;
      for (const t of modeTokens) if (hitTokens.has(t)) shared++;
      if (shared > bestScore) {
        bestScore = shared;
        bestHit = hit;
      }
    }
    // Seuil : au moins 1 token significatif partagé pour overrider.
    if (bestHit && bestScore >= 1 && bestHit.channels !== mode.channels) {
      return { ...mode, channels: bestHit.channels };
    }
    return mode;
  });
}

async function discoverModesOnce(manualText, manufacturer, fixtureName, env, retry, retryCtx) {
  const retryNote = retry
    ? `\n\n⚠️ ATTENTION — A previous extraction returned only ${retryCtx.alreadyFound.length} modes but the manual declares more (declared_count > modes.length). Modes found so far: ${retryCtx.alreadyFound.map(m => `"${m.name}" (${m.channels}ch)`).join(', ')}. You MUST find the missing ${retryCtx.missing} mode(s) IF AND ONLY IF the manual explicitly names them. Do NOT invent "High Resolution" or "16-bit" variants that aren't literally written. Better to return fewer correct modes than to hallucinate extras.`
    : '';

  const prompt = `You are reading a DMX lighting fixture manual. Find EVERY DMX control mode (also called "profile", "personality", or "operating mode") declared in this manual and return them as JSON.

Fixture: ${manufacturer} ${fixtureName}${retryNote}

Output FORMAT — strictly this JSON object, nothing else, no markdown, no comments:
{
  "declared_count": <integer N — see rule 1>,
  "modes": [
    {"name": "<exact mode name as written in the manual>", "channels": <integer DMX channel count>},
    ...
  ]
}

⚠️ Do NOT invent or copy mode names. Use ONLY names that appear verbatim in this specific manual. If the manual lists "1: RGB", the entry is {"name":"1: RGB","channels":3}. If it lists "Normal Mode (34 channels)", it's {"name":"Normal Mode","channels":34}. Never substitute names from other fixtures.

Rules — non-negotiable:
1. "declared_count" = the integer N if the manual explicitly says e.g. "You can choose between N DMX modes", "N profiles available", "Total: N", etc. If the manual does not state a total count, set this to the length of your modes array.
2. EVERY mode declared in the manual must appear in "modes", in the order written. Some manuals have 3 modes, others have 7, others have 100+ (Astera-style profile catalogs). Do not stop at 7 if there are more.
3. **Mode variants count as separate modes ONLY IF the manual EXPLICITLY names them.** If the manual literally writes "Normal Mode (34 channels)" AND "High Resolution Mode (35 channels)" as two distinct entries — both go in. But do NOT invent a "High Resolution" twin for every base mode. Many fixtures only have ONE version per profile; if the manual lists only "6 CH / 8 CH / 10 CH", do NOT auto-add "High Resolution 6 CH / 8 CH / 10 CH". Hallucinating variants that aren't written is forbidden.
4. "name" = the mode name VERBATIM from the manual. Keep prefix numbers ("17: RGB.RGB.", "89: D CCT GM CRO RGB"), keep suffixes ("High Resolution", "(PIXEL = 4; STROBE = ON)", "S"), keep punctuation. Do not abbreviate.
5. "channels" = the integer number of DMX channels USED by that mode (= number of DMX slots / addresses occupied by that mode).
   **PRIORITY ORDER for finding this number :**
     (a) FIRST look for an EXPLICIT prose statement of the count near the mode name, in this exact priority :
         "requires N DMX channels" / "requiert N canaux DMX" / "uses N DMX channels" / "N channel mode" / "(N channels)" / "N CH" / "N-channel" / "N ch".
         If you find one, USE IT VERBATIM. Do not try to verify by counting the table — the prose statement is the manufacturer's official count and is authoritative.
     (b) ONLY if there is NO prose statement, fall back to counting : the channel count is the HIGHEST DMX channel number that appears in that mode's column of the protocol table.
   **CRITICAL — NEVER use the number from "16 bits" / "8 bits" / "16 bit dimming" / "Mode 16 bits" as the channel count.** These describe bit-depth (resolution), NOT channel count.
   Worked example — Martin MAC Viper protocol manual contains the sentence :
     "Le MAC Viper Profile requiert 26 canaux DMX en mode basique 16 bits et 34 canaux DMX en mode 16 bits étendu."
   Correct extraction following priority (a) :
     [{"name":"Mode basique 16 bits","channels":26},{"name":"Mode 16 bits Etendu","channels":34}]
   - "Mode basique 16 bits" → 26 (from "requiert 26 canaux DMX")
   - "Mode 16 bits Etendu" → 34 (from "et 34 canaux DMX en mode 16 bits étendu")
   - NOT 16 (resolution, ignored)
   - NOT 34 / 35 (do not over-count by including reserved-channel rows or header rows)
   - NOT counting the protocol table — the prose statement is authoritative.
6. **Parallel-column DMX tables describe MULTIPLE modes in one table.** Some manuals (Martin, Robe, etc.) present the protocol as a single table where the first 2, 3 or even 4 columns are DMX channel numbers, one column per mode (e.g. "Mode basique 16 bits" + "Mode 16 bits Etendu", followed by "DMX value / Function / Default"). In that layout:
   - The MODE NAMES are the column headers of the channel-number columns. They can be VERY abbreviated. Examples of abbreviated headers that ARE valid mode names :
       "St" / "Ba" / "Ex" → Standard / Basic / Extended (Robe Cobra style)
       "M1" / "M2" / "M3" → Mode 1 / Mode 2 / Mode 3
       "Std" / "Adv" / "Ext"
       "8b" / "16b" / "Compr"
     Expand abbreviated headers to full readable names when you set "name", e.g. "St" → "Standard", "Ba" → "Basic", "Ex" → "Extended".
   - Generic column headers like "DMX", "Value", "Pourcent", "Percent", "%", "Function", "Fonction", "Default", "Défaut", "Trans fert", "Fade", "Notes" are NOT modes — they are value / description columns. NEVER list them as modes.
   - The CHANNEL COUNT of a mode = the highest channel number that appears in its column (or, equivalently, the number of distinct rows where that column has a value). For Robe Cobra "St=35, Ba=33, Ex=45" the modes are : Standard 35ch, Basic 33ch, Extended 45ch.
6a) **Document title vs mode name.** The TITLE of the manual or document (e.g. "COBRA From SW 111", "MAC Viper Profile", "X4 Bar 20", "Spiider firmware v1.2") is NEVER a mode. Mode names appear inside the protocol table as column headers, or in a separate "Operating Modes" / "Modes DMX" section. Never list the document title as a mode.
6b) **ChannelSet labels vs mode names.** Phrases like "Prism Mode Full", "Prism Mode Simple", "Spot mode", "Beam mode", "Special mode" that appear as VALUE RANGES inside a channel (e.g. "75-79 Prism Mode Full") are CHANNEL SET labels, NOT mode names. They describe what the channel does at a given DMX value. NEVER list them as modes. The list of modes is determined by the column headers of the protocol table, NOT by the words "mode" appearing inside a channel's value table.
7. If "modes.length" < "declared_count", re-read the manual — you are missing modes. If "modes.length" > what the manual literally declares, you are hallucinating — remove the invented entries.

Manual:
${manualText}`;

  const resp = await callOpenAI(prompt, env, {
    // 6000 tokens permettent jusqu'à ~150 entrées de mode (~40 tokens each).
    // Couvre les catalogues Astera et autres fixtures à profils nombreux.
    max_tokens: 6000,
    system: 'You return strict JSON. No prose, no markdown fence, no comments. Use ONLY mode names that appear verbatim in the provided manual.',
    model: MODEL_DISCOVERY,
  });

  // Parse — robuste aux éventuels backticks que GPT pourrait coller.
  let cleaned = resp.replace(/^```json\s*/m, '').replace(/^```\s*/m, '').trim();
  const firstBrace = cleaned.indexOf('{');
  const lastBrace = cleaned.lastIndexOf('}');
  if (firstBrace >= 0 && lastBrace > firstBrace) {
    cleaned = cleaned.substring(firstBrace, lastBrace + 1);
  }
  let parsed;
  try {
    parsed = JSON.parse(cleaned);
  } catch (e) {
    throw new Error('JSON invalide depuis mode discovery: ' + cleaned.substring(0, 200));
  }
  let modes = Array.isArray(parsed.modes)
    ? parsed.modes.filter(m => m && typeof m.name === 'string' && Number.isInteger(m.channels) && m.channels > 0)
    : [];
  // Déduplication par nom — l'IA produit parfois des doublons (ex: "24: RGB CCT DIM IND"
  // et "24: RGB CCT DIM IND High Resolution" comme deux entrées pour le même profil).
  const seen = new Set();
  modes = modes.filter(m => {
    const key = m.name.trim().toLowerCase();
    if (seen.has(key)) return false;
    seen.add(key);
    return true;
  });
  const declared = Number.isInteger(parsed.declared_count) ? parsed.declared_count : null;
  return { modes, declared };
}

// ────────────────────────────────────────────────────────────────────────────
//  Per-mode targeting — localise la section du manuel pour un mode donné.
//
//  Sur les manuels énormes (Astera Titan 530K chars), envoyer tout le manuel
//  à gpt-4o tier 1 dépasse le TPM bucket (30K tokens/min) → HTTP 429 "Request
//  too large". En envoyant juste la section du mode demandé (~5-10K chars),
//  chaque appel reste sous 10K tokens, fits TPM ET coûte ~10x moins cher.
//
//  Stratégies :
//    1. Mode numéroté "N: <name>" (Titan) : trouve l'ancre dans le corps
//       (skip les entrées TOC qui contiennent "...." ou "page N"), prend
//       de l'ancre jusqu'au prochain mode N+1 (ou +12K chars max).
//    2. Mode par nom exact (Cobra "Standard", StickKolor "6 CH", etc.) :
//       cherche le nom comme en-tête, prend une fenêtre ±10K chars.
//
//  Retourne null si on ne trouve pas d'ancre fiable → le caller utilisera
//  le texte augmenté complet (ancien comportement, inchangé pour les
//  fixtures dont l'ancrage par nom échoue).
// ────────────────────────────────────────────────────────────────────────────
function findModeSection(pdfText, modeName) {
  if (!pdfText || !modeName) return null;

  // Stratégie 1 : modes numérotés "N: <name>" (Titan-style)
  const numMatch = modeName.match(/^(\d+):/);
  if (numMatch) {
    const num = numMatch[1];
    const re = new RegExp(`\\n\\s*${num}:\\s+([^\\n]+)`, 'g');
    const hits = [];
    let m;
    while ((m = re.exec(pdfText)) !== null) {
      const line = m[1];
      // Skip TOC entries (containing dots ".......", "…", or "page N")
      if (line.includes('....') || line.includes('…') || /page\s*\d+/i.test(line)) continue;
      hits.push(m);
    }
    if (hits.length > 0) {
      const anchorIdx = hits[0].index;
      const start = Math.max(0, anchorIdx - 500);
      // Va jusqu'au prochain mode N+1 (ou +12K chars max si pas trouvé).
      let end = anchorIdx + 12000;
      const nextNum = parseInt(num) + 1;
      const nextRe = new RegExp(`\\n\\s*${nextNum}:\\s+`, 'g');
      const slice = pdfText.substring(anchorIdx);
      const nextMatch = nextRe.exec(slice);
      if (nextMatch && nextMatch.index > 100 && nextMatch.index < 12000) {
        end = anchorIdx + nextMatch.index + 500;
      }
      return pdfText.substring(start, Math.min(end, pdfText.length));
    }
  }

  // Stratégie 2 : recherche du nom de mode comme en-tête de section.
  // Échappe les caractères regex et cherche en mode insensible à la casse.
  const safeName = modeName.replace(/[.*+?^${}()|[\]\\]/g, '\\$&').trim();
  if (safeName.length < 3) return null;  // évite les faux positifs sur "St", "Ba"
  const re2 = new RegExp(`(^|\\n)\\s*${safeName}\\b`, 'gi');
  const hits2 = [];
  let m2;
  while ((m2 = re2.exec(pdfText)) !== null) hits2.push(m2);
  if (hits2.length > 0) {
    // Si plusieurs hits, prend le 2e (le 1er est souvent la TOC).
    // Si un seul, prend-le.
    const anchor = hits2.length > 1 ? hits2[1] : hits2[0];
    const anchorIdx = anchor.index;
    const start = Math.max(0, anchorIdx - 2000);
    const end = Math.min(pdfText.length, anchorIdx + 15000);
    return pdfText.substring(start, end);
  }

  return null;
}

// ────────────────────────────────────────────────────────────────────────────
//  Étape 2 — wrapper avec retry par mode.
//  Stratégie d'escalade :
//    - Essai 1 : modèle principal (gpt-4o) sur la SECTION du mode (per-mode
//      targeting) si on a pu la localiser, sinon sur le texte augmenté complet.
//    - Essai 2 : gpt-4o sur texte alternatif (manuel complet ou réduit 80K
//      selon si la section ciblée a été utilisée à l'essai 1).
//  Retourne TOUJOURS un objet { xml?, error?, mode }.
// ────────────────────────────────────────────────────────────────────────────
async function extractWithRetry(mode, manualText, manufacturer, fixtureName, env, detectedModes, fullPdfText) {
  let lastError = '';
  let previousAttemptFeedback = null;

  // Per-mode targeting : tente de localiser la section précise du manuel
  // pour ce mode. Si on trouve, on n'envoie que ~5-10K chars au lieu de
  // 150K → coût ÷10, fits TPM tier 1, ~5x plus rapide.
  let targetText = manualText;
  let usedTargeting = false;
  if (fullPdfText) {
    const section = findModeSection(fullPdfText, mode.name);
    // Sanity : on utilise la section seulement si elle réduit significativement
    // (sinon on perd les bénéfices et on risque de tronquer une vraie table).
    if (section && section.length < manualText.length * 0.7 && section.length > 800) {
      targetText = section;
      usedTargeting = true;
      console.log(`Per-mode targeting "${mode.name}": ${manualText.length} → ${section.length} chars`);
    }
  }

  const attempts = [
    { model: MODEL_EXTRACTION, text: targetText },
    // Retry : si essai 1 sur section ciblée a foiré, on retombe sur le
    // texte complet (peut-être qu'on a tronqué trop tôt et la vraie table
    // est ailleurs). Sinon (pas de targeting), retry avec texte réduit 80K.
    {
      model: 'gpt-4o',
      text: usedTargeting ? manualText : manualText.substring(0, MAX_INPUT_CHARS_EXTRACT_GPT4O_RETRY)
    },
  ];

  for (let i = 0; i < attempts.length; i++) {
    const { model, text } = attempts[i];
    try {
      const xml = await extractChannelsForMode(
          mode, text, manufacturer, fixtureName, env, model, previousAttemptFeedback, detectedModes);

      // Hard fail : XML vide ou sans <Num>.
      const actualHighestSlot = countHighestDmxSlot(xml);
      if (actualHighestSlot === 0) {
        previousAttemptFeedback =
            `Your previous output was empty or had no valid <Num> tags. The manual contains a DMX table for "${mode.name}" — find it and emit one <Ch> per row.`;
        throw new Error(`No channels extracted`);
      }

      // Soft retry : count très en dessous de l'estimation discovery (< 50%).
      const halfTarget = Math.floor(mode.channels * 0.5);
      if (actualHighestSlot < halfTarget && i < attempts.length - 1) {
        previousAttemptFeedback =
            `Your previous attempt found only ${actualHighestSlot} channels for "${mode.name}", but discovery estimated ${mode.channels}. Either the manual's table really has fewer (then leave it as-is), or you missed parts of the table — re-read it carefully. Do NOT invent channels.`;
        throw new Error(`Low count: ${actualHighestSlot}/${mode.channels}`);
      }

      // Soft retry GAP : compte le nombre RÉEL de <Ch> tags, pas juste le plus
      // haut <Num>. Cas Color Strike-M 97CH : le highest slot peut être 97
      // (mode bien terminé) MAIS le count est 58 → l'IA a sauté des canaux
      // du milieu (typiquement quand le tableau s'étale sur plusieurs pages
      // PDF et que l'IA n'a vu que la première + la dernière).
      // Seuil : count < 80% du compte attendu → l'IA a sauté du contenu.
      // v20 (post ColorStrike-M 97CH KO).
      const actualChannelCount = (xml.match(/<Ch>/g) || []).length;
      const gapThreshold = Math.floor(mode.channels * 0.8);
      if (
        actualChannelCount < gapThreshold &&
        actualHighestSlot >= halfTarget &&  // évite double-feedback avec le check précédent
        i < attempts.length - 1
      ) {
        previousAttemptFeedback =
            `Your previous attempt emitted only ${actualChannelCount} <Ch> tags for "${mode.name}", but discovery estimated ${mode.channels} channels. The highest channel number you extracted is ${actualHighestSlot}, so the table likely spans multiple PDF pages and you SKIPPED channels in the middle. Re-read the manual carefully — find the channels between your first emitted <Num> and your last <Num>. The table's channel numbers are CONTINUOUS (1, 2, 3, ..., N) with NO gaps. Emit ALL ${mode.channels} channels in order.`;
        throw new Error(`Gap detected: ${actualChannelCount} emitted but highest=${actualHighestSlot} (expected ${mode.channels})`);
      }

      // Validation slots-wheels : pour les canaux Color Wheel / Gobo Wheel /
      // FX / Animation / Pattern, l'IA collapse souvent à 1 entrée générique.
      // On détecte ça par <Func> avec 0 ou 1 séparateur "|" et on retry.
      const collapsedWheels = detectCollapsedWheelChannels(xml);
      if (collapsedWheels.length > 0 && i < attempts.length - 1) {
        previousAttemptFeedback =
            `Your previous output collapsed the following wheel channels to a single generic label: ${collapsedWheels.join(', ')}. For EACH of these, look in the manual for the channel's sub-table — it has 15-30+ rows describing each DMX value range (e.g. "0=Open", "1-14=Open to Slot 1", "15=Slot 1", ..., "186-211=CW fast to slow", "212-217=Stop", "218-243=CCW slow to fast"). EVERY row goes into <Func> separated by "|". Even if the manual splits the rows across French sub-sections (Indexation, Rotation continue, Oscillation, Couleurs aléatoires), merge them all. Do NOT output "0-255=Color Wheel Selection" or any single-range generic placeholder.`;
        throw new Error(`Wheel channels collapsed: ${collapsedWheels.join(', ')}`);
      }

      return { xml, mode, modelUsed: model, actualChannels: actualHighestSlot };
    } catch (e) {
      lastError = `[${model} attempt ${i + 1}] ${e.message || String(e)}`;
      // Erreur 429 (rate limit) sur gpt-4o : pas de retry, on retomberait
      // dans la même limite.
      if (lastError.includes('429') && model === 'gpt-4o') break;
    }
  }
  return { error: lastError, mode };
}

// Détecte les canaux wheel-type dont le <Func> a été collapsé à une seule
// entrée générique (genre "0-255=Color Wheel Selection"). Retourne la liste
// des noms de canaux à signaler à l'IA pour un retry.
function detectCollapsedWheelChannels(xml) {
  const collapsed = [];
  // Capture chaque <Ch>...</Ch>
  const chRe = /<Ch>([\s\S]*?)<\/Ch>/g;
  let m;
  while ((m = chRe.exec(xml)) !== null) {
    const block = m[1];
    const nameMatch = block.match(/<ChanName>([^<]*)<\/ChanName>/);
    const funcMatch = block.match(/<Func>([^<]*)<\/Func>/);
    if (!nameMatch || !funcMatch) continue;
    const name = nameMatch[1].trim();
    const func = funcMatch[1];
    // Mots-clés qui identifient un canal à slots discrets.
    const nameLower = name.toLowerCase();
    const isWheel =
      /\bcolor\s*wheel|roue\s*de\s*couleur/.test(nameLower) ||
      /\bgobo\s*wheel|roue\s*de\s*gobo|roue\s*d[ '"]?abstraits|roue\s*de\s*volum/.test(nameLower) ||
      /\bgobo\s*w\s*\d|gobo\s*\d\s*sel/.test(nameLower) ||
      /\banimation\s*wheel|pattern\s*wheel|\beffects?\s*wheel|fx\s*sel/.test(nameLower) ||
      /\bcolor\s*macro/.test(nameLower);
    if (!isWheel) continue;
    // Compte les entrées dans Func séparées par "|".
    const entries = func.split('|').filter(s => s.includes('='));
    // Si <= 2 entrées, considéré comme collapsé (un vrai wheel a ≥ 5 slots).
    if (entries.length <= 2) {
      collapsed.push(`"${name}"`);
    }
  }
  return collapsed;
}

// Inspecte le XML rendu et retourne la plus haute position DMX (<Num>).
function countHighestDmxSlot(xml) {
  let maxNum = 0;
  const re = /<Num>(\d+)<\/Num>/g;
  let m;
  while ((m = re.exec(xml)) !== null) {
    const v = parseInt(m[1]);
    if (!isNaN(v) && v > maxNum) maxNum = v;
  }
  return maxNum;
}

// ────────────────────────────────────────────────────────────────────────────
//  Étape 2 — Channel extraction (un appel par mode)
//  Chaque appel produit un seul <Mode>...</Mode> avec ses N canaux.
// ────────────────────────────────────────────────────────────────────────────
async function extractChannelsForMode(mode, manualText, manufacturer, fixtureName, env, model, previousAttemptFeedback, detectedModes) {
  const retryNote = previousAttemptFeedback
    ? `\n\n⚠️ Previous attempt feedback: ${previousAttemptFeedback}\nRe-read the manual carefully and try to find the missing channels in the table.\n`
    : '';

  // Aide contextuelle pour les tableaux à colonnes parallèles : indique
  // explicitement à l'IA QUELLE colonne du tableau correspond au mode demandé,
  // ET la liste DÉTERMINISTE des paires 16-bit pré-détectées par le
  // microservice (issue du tableau lui-même via pdfplumber, pas de l'IA).
  let columnMappingHint = '';
  if (Array.isArray(detectedModes) && detectedModes.length >= 2) {
    const lines = ['========== COLUMN MAPPING (USE STRICTLY) =========='];
    let myMode = null;
    const norm = (s) =>
      String(s || '').toLowerCase().replace(/\bmode\b/g, '').replace(/[^a-z0-9]+/g, ' ').trim();
    const mNorm = norm(mode.name);
    for (const dm of detectedModes) {
      const dmNorm = norm(dm.expanded_name);
      const dmLabelNorm = norm(dm.label);
      const isMyMode =
        (dmNorm && (mNorm.includes(dmNorm) || dmNorm.includes(mNorm))) ||
        (dmLabelNorm && (mNorm.includes(dmLabelNorm) || dmLabelNorm.includes(mNorm)));
      lines.push(
        `Column "${dm.label}" in the tabular tables = mode "${dm.expanded_name}" (${dm.channels} channels)`
        + (isMyMode ? '  ← THIS IS YOUR MODE' : ''),
      );
      if (isMyMode && !myMode) myMode = dm;
    }
    if (myMode) {
      lines.push('');
      lines.push(`⚠️ For mode "${mode.name}", you MUST read ONLY column "${myMode.label}".`);
      lines.push(
        `Skip any row where column "${myMode.label}" is empty (= channel doesn't exist in your mode).`,
      );
      lines.push(
        `Emit channels with sequential <Num> values starting at 1 (Num=1 for the first kept row, Num=2 for the second, etc.). Do NOT use the channel numbers from the column "${myMode.label}" as <Num> — those are the manual's channel numbers, but GDTF expects 1-indexed sequential.`,
      );
      const pairs = myMode.pairs_16bit || [];
      if (pairs.length > 0) {
        lines.push('');
        lines.push(`========== 16-BIT PAIRS for mode "${mode.name}" (use STRICTLY these pairs) ==========`);
        lines.push(
          `The following channel numbers (in column "${myMode.label}") form 16-bit MSB+LSB pairs. For EACH pair, emit ONE channel Res="16bit-coarse" (MSB) AND ONE channel Res="16bit-fine" (LSB) with the SAME name but suffix " Fine" on the LSB.`,
        );
        for (const p of pairs) {
          lines.push(`  - column "${myMode.label}" ch ${p[0]} (MSB) + ch ${p[1]} (LSB) = 16-bit pair`);
        }
        lines.push(
          `Total channels declared for mode "${mode.name}" = ${myMode.channels} DMX slots (with ${pairs.length} pairs occupying ${pairs.length * 2} of those slots).`,
        );
      }
    }
    columnMappingHint = '\n' + lines.join('\n') + '\n';
  }

  // Hint per-pixel : si discovery a mesuré N canaux et que le manuel utilise
  // une notation abrégée (……, ..., etc.) pour les modes per-pixel répétitifs
  // (cas StickKolor mode 72 : 12 pixels × 6 LEDs RGBAW+UV), on injecte un
  // mode d'emploi explicite pour que l'IA expanse les canaux intermédiaires.
  //
  // GARDE-FOU (ajouté v19) : on ne déclenche le hint QUE si :
  //   - mode.channels >= 24 (au moins 4 pixels × 6 LEDs, sinon improbable)
  //   - ET le nom du mode contient un indice explicite : un nombre N >= 12,
  //     ou les mots "pixels"/"cells"/"canaux"/"channels"/"all pixels".
  // Pour mode 10/8/6 sans signal per-pixel dans le nom, on n'injecte rien
  // (sinon l'IA force des suffixes d'instance qui cassent le mode flat).
  let perPixelHint = '';
  const looksPerPixel =
    mode.channels >= 24 &&
    (
      /\bpixels?\b|\bcells?\b|\ball\s+pixels?\b|\bzones?\b|\bsegments?\b/i.test(mode.name)
      || /\d{2,3}\s*(?:canaux|ch|channels?)/i.test(mode.name)
      || /\b(?:mode\s+)?\d{2,3}\b/.test(mode.name)
    );
  if (looksPerPixel) {
    perPixelHint = `
========== EXPECTED CHANNEL COUNT & PER-PIXEL EXPANSION ==========
Discovery measured ${mode.channels} DMX channels for mode "${mode.name}".

If the manual abbreviates a per-pixel block using "……", "...", "etc.", or jumps from the first pixel to the last (e.g. "CH1 CH2 CH3 …… CH70 CH71 CH72" with "R1 V1 B1 …… Blanc12 A12 U12"), you MUST ENUMERATE every intermediate channel — DO NOT emit just the unique colors.

Enumeration recipe:
1. Detect the colors from the FIRST pixel block and the LAST pixel block (e.g. R, V/G, B, Blanc/W, A, UV = 6 colors).
2. Compute n_pixels = (${mode.channels} - n_master_channels) / colors_per_pixel (e.g. 72 / 6 = 12 pixels, or (76 - 4) / 6 = 12 pixels).
3. Emit channels in per-pixel order, each per-pixel <ChanName> ending with its instance number:
   R1, V1, B1, W1, A1, UV1, R2, V2, B2, W2, A2, UV2, …, R\${n}, V\${n}, B\${n}, W\${n}, A\${n}, UV\${n}.
4. Total number of <Ch> emitted = ${mode.channels} EXACTLY (no more, no less). Master channels (Dimmer, Strobe, ColorMacro, Speed, Control) keep their original names without instance suffixes.

If the manual lists every channel explicitly (no ellipsis), keep them verbatim — do NOT re-enumerate or add suffixes.
`;
  }

  const prompt = `Extract every DMX channel of mode "${mode.name}" from this ${manufacturer} ${fixtureName} manual.${retryNote}${columnMappingHint}${perPixelHint}

THE #1 RULE — WHEEL CHANNELS NEED THEIR FULL SLOT TABLE

When a channel has a sub-table in the manual (Shutter, Strobe, Color Wheel, Gobo Wheel, FX/Animation/Pattern Wheel, ColorMacro, Reset, Control), <Func> MUST list EVERY row separated by "|". NEVER summarize.
WRONG : <Func>0-255=Color Wheel Selection</Func>
RIGHT : <Func>0=Open|1-14=Open to Slot 1|15=Slot 1|16-29=Slot 1 to Slot 2|...|244-247=Random fast|252-255=Random slow</Func>
If the sub-table is split across sub-sections (Indexed / Rotation / Oscillation / Random), MERGE them all into a single <Func>.

OTHER RULES

A) Output exactly the rows of the protocol table for "${mode.name}". Do NOT invent channels not in the table. Do NOT skip rows.
B) Parallel-column protocol tables : when the table has multiple channel-number columns (e.g. "St" "Ba" "Ex" or "Mode basique" "Mode Etendu"), use ONLY the column of YOUR mode. If the cell is EMPTY for your mode, that channel doesn't exist in your mode — skip the row.

B+) MULTI-COLUMN — EMPTY LEFT CELL (critical for AQUA 480, MAC Aura, etc.) : when the table has columns "Short" / "Standard" / "Extended" (or "Basic" / "Standard" / "Extended"), a row can have FEWER numbers than columns. The missing numbers are typically on the LEFT (basic modes lack 16-bit / fine refinements that advanced modes have).
   Decision rule when you see a row with N numbers but K columns (N < K) :
     - If the row's function contains "Fine", "16-bit", "16 bit", "Fade Time", "Speeds", "Speed Mode", "Time Mode" → the LEFT cell(s) are empty. Assign numbers RIGHT-TO-LEFT.
     - Examples on AQUA 480 (cols = Short / Standard / Extended) :
         "3 3 Dimmer Fine"      → Short=empty, Standard=3, Extended=3
         "6 Cyan Fine"          → Short=empty, Standard=empty, Extended=6
         "22 25 Pan Fine"       → Short=empty, Standard=22, Extended=25
         "24 27 Tilt Fine"      → Short=empty, Standard=24, Extended=27
         "25 28 Pan & Tilt Speeds" → Short=empty, Standard=25, Extended=28
     - Rule of thumb : if the function name contains "Fine", "Speeds", or "16-bit", the row is ALWAYS present in Extended; ALMOST ALWAYS present in Standard; NEVER in Short.
   If your mode is "Standard Mode" and you see "22 25 Pan Fine", emit a <Ch> for Pan Fine at Standard slot 22 (paired as LSB with the Pan MSB row above it).
C) 16-bit pairs : a channel is 16-bit in your mode ONLY IF both the MSB row AND the LSB row have a number in YOUR mode's column. Empty LSB cell = 8-bit (only MSB exists). Mark Res="16bit-coarse" + "16bit-fine" only when both exist.
D) Control channel (long sub-table of reset/calibration/personality commands) is ONE channel with all sub-rows merged in its <Func>. NOT multiple channels.
E) Reserved rows ("Réservé / Reserved for future use") in the protocol table are real channels — emit one <Ch> per reserved row.
F) IGNORE menu tables (Setup / Personality / Control menus / Table 2). They are physical menu items, not DMX channels.
G) Channel names verbatim from the manual. Two channels in a mode must have UNIQUE names. Per-pixel R/G/B/W/A/UV must carry an explicit instance number.
H) 16-bit fine channel → Res="16bit-fine". Coarse before → Res="16bit-coarse". Otherwise "8bit". Func format : "|" between rows, "=" before label, "-" for ranges, never empty.
I) MULTI-PAGE TABLES (CRITICAL) : a protocol table for ONE mode often spans MULTIPLE PDF pages. The mode header (e.g. "97CH", "Mode 24CH", "Extended Mode") appears ONLY on the FIRST page of the table, but channels CONTINUE on the next pages without re-printing the header. Channel numbers are CONTINUOUS (1, 2, 3, ... N) from start to end of the table. If you see channel 9 on one page and channel 80 on another page with NO mode header between them, the channels 10-79 EXIST and are on intermediate pages — find and emit them. NEVER produce a mode with gaps in channel numbering (e.g. ch 1-9 then ch 51-97). Total channel count emitted must equal the mode's declared count (${mode.channels}).
J) CHANNEL COUNT SELF-CHECK : before closing </Mode>, count your emitted <Ch> tags. If count != ${mode.channels}, re-read the manual — you missed pages or rows. Empty pages in the middle of a table do NOT mean the table ended; only a NEW mode header or a different section ("Beam Patterns", "Color Wheel Slots", "Plate Patterns") indicates the table is finished.

═══════════════════════════════════════════════════════════════════════════
OUTPUT FORMAT — no prose, no markdown, only this XML
═══════════════════════════════════════════════════════════════════════════
<Mode>
<ModeName>${escapeXml(mode.name)}${looksPerPixel ? ' (Nch)' : ''}</ModeName>
<Channels>
<Ch><Num>1</Num><ChanName>…</ChanName><Res>…</Res><Func>…</Func></Ch>
… one row per ACTUAL channel from the manual's table …
</Channels>
</Mode>

Manual:
${manualText}`;

  // max_tokens : plancher haut + adaptatif. L'ancienne formule (1500 + N*60)
  // sous-allouait quand la discovery se trompait sur le compte (cas Cobra :
  // discovery → 12, mais l'IA voit 32 canaux dans le manuel → sortie
  // tronquée mi-canal → pas de </Mode> → parser Flutter perd tout).
  // OpenAI ne facture que les tokens consommés, donc un plafond généreux
  // coûte zéro de plus quand l'IA n'en a pas besoin.
  // Formule : plancher 8000, ou 1500 + N*150 si plus grand.
  const adaptiveMaxTokens = Math.max(8000, 1500 + mode.channels * 150);

  const resp = await callOpenAI(prompt, env, {
    max_tokens: adaptiveMaxTokens,
    system:
        'Strict XML emitter. No prose, no markdown. '
        + 'For per-pixel modes (R/G/B/W/A/UV repeated per pixel/cell/zone), '
        + 'every per-pixel <ChanName> MUST end with an explicit instance number. '
        + 'Two channels of the same mode must have unique names. '
        + 'CRITICAL: for ANY channel with a discrete state table in the manual '
        + '(Shutter, Strobe, Color Wheel, Roue de couleur, Gobo Wheel, Roue de '
        + 'gobo, Gobo W N, Animation Wheel, FX Sel, Pattern Wheel, ColorMacro, '
        + 'Control, Reset, Lamp Control), <Func> MUST list EVERY row from the '
        + 'sub-table (typically 5-30+ entries: "<dmx>=<label>|<dmx>=<label>|..."). '
        + 'It is FORBIDDEN to collapse such a channel to a single "0-255=Ouvert" '
        + 'or "0-255=Choix du filtre de couleur" or "0-255=Color Wheel Selection". '
        + 'Example correct Shutter Func: "0-19=Closed|20-49=Open|50-200=Strobe '
        + 'slow to fast|211-255=Random strobe".',
    model: model || MODEL_EXTRACTION,
  });

  let cleaned = resp.replace(/^```xml\s*/m, '').replace(/^```\s*/m, '').trim();
  // Garde uniquement la portion <Mode>...</Mode> (au cas où le modèle bavarde).
  const start = cleaned.indexOf('<Mode>');
  const end = cleaned.lastIndexOf('</Mode>');
  if (start >= 0 && end > start) {
    cleaned = cleaned.substring(start, end + '</Mode>'.length);
  }
  if (!cleaned.startsWith('<Mode>')) {
    throw new Error('Réponse XML invalide pour mode "' + mode.name + '"');
  }
  // Patch 1 : détection de troncature. Si </Mode> est absent, le modèle a
  // dépassé son budget tokens et la sortie est coupée mi-canal. On lève
  // une erreur pour que extractWithRetry retente (gpt-4o, ou budget plus
  // élevé via la formule patchée plus haut).
  if (!cleaned.includes('</Mode>')) {
    throw new Error(
      'Réponse tronquée pour mode "' + mode.name + '" : </Mode> manquant '
      + '(sortie probablement coupée par max_tokens=' + adaptiveMaxTokens + ')',
    );
  }
  return cleaned;
}

// ────────────────────────────────────────────────────────────────────────────
//  Wrapper appel OpenAI commun
// ────────────────────────────────────────────────────────────────────────────
async function callOpenAI(userPrompt, env, { max_tokens, system, model }) {
  // Retry sur HTTP 429 (rate limit / TPM dépassé) avec backoff respectant
  // le header `Retry-After` si présent. Cas concret JDC1 SPix 68ch : 4-5
  // modes lancés en parallèle, ~150K chars chacun → ~750K TPM en burst,
  // au-dessus du tier 1 OpenAI. Sans ce retry, le mode était perdu.
  //
  // - max 4 tentatives total (1 initiale + 3 retries) — v20, +1 vs précédent
  // - délai = max(Retry-After, 2^attempt * baseDelay) + jitter
  // - autres erreurs HTTP : throw immédiat (pas de retry-spam)
  const MAX_429_ATTEMPTS = 4;
  let lastErrText = '';
  for (let attempt = 0; attempt < MAX_429_ATTEMPTS; attempt++) {
    // Abort si l'appel dépasse CALL_TIMEOUT_MS : on préfère perdre UN mode
    // plutôt que faire poireauter l'utilisateur 3 minutes.
    const controller = new AbortController();
    const timeoutId = setTimeout(() => controller.abort(), CALL_TIMEOUT_MS);

    let resp;
    try {
      resp = await fetch(OPENAI_URL, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${env.OPENAI_API_KEY}`
        },
        body: JSON.stringify({
          model: model || MODEL_EXTRACTION,
          temperature: TEMPERATURE,
          max_tokens,
          messages: [
            { role: 'system', content: system },
            { role: 'user', content: userPrompt },
          ],
        }),
        signal: controller.signal,
      });
    } catch (e) {
      clearTimeout(timeoutId);
      if (e.name === 'AbortError') throw new Error(`Timeout (>${CALL_TIMEOUT_MS / 1000}s)`);
      throw e;
    }
    clearTimeout(timeoutId);

    if (resp.ok) {
      const data = await resp.json();
      const content = data.choices?.[0]?.message?.content ?? '';
      if (!content) throw new Error('Réponse OpenAI vide');
      return content;
    }

    const errText = await resp.text();
    lastErrText = errText.substring(0, 200);

    // Retry seulement sur 429 (rate limit). Autres erreurs (400, 401, 500…) → throw.
    if (resp.status !== 429) {
      throw new Error('OpenAI HTTP ' + resp.status + ': ' + lastErrText);
    }

    // Dernière tentative : on abandonne avec un message clair.
    if (attempt === MAX_429_ATTEMPTS - 1) {
      throw new Error('OpenAI HTTP 429 (rate limit) après ' + MAX_429_ATTEMPTS + ' tentatives: ' + lastErrText);
    }

    // Compute delay: Retry-After header (en secondes ou date HTTP) > backoff exp.
    let delayMs = 0;
    const retryAfter = resp.headers.get('retry-after');
    if (retryAfter) {
      const asInt = parseInt(retryAfter, 10);
      if (!isNaN(asInt) && asInt > 0) delayMs = asInt * 1000;
    }
    // Backoff exponentiel : 3s, 6s, 12s, 24s. + jitter ±20% pour éviter thundering herd.
    // v20 : baseDelay 1000→1500ms pour laisser plus de temps au TPM bucket de se recharger.
    const expBackoffMs = Math.pow(2, attempt + 1) * 1500;
    if (delayMs < expBackoffMs) delayMs = expBackoffMs;
    delayMs = Math.floor(delayMs * (0.8 + Math.random() * 0.4));
    // Cap : on ne dort jamais plus de 30s — au-delà l'utilisateur attend trop.
    // v20 : cap 20000→30000 pour mieux respecter les Retry-After longs.
    if (delayMs > 30000) delayMs = 30000;
    console.log(`OpenAI 429 (attempt ${attempt + 1}/${MAX_429_ATTEMPTS}), sleeping ${delayMs}ms`);
    await new Promise(r => setTimeout(r, delayMs));
  }
  // Théoriquement inaccessible mais TypeScript-style guard.
  throw new Error('OpenAI HTTP 429 : ' + lastErrText);
}

// ────────────────────────────────────────────────────────────────────────────
//  Utilitaires
// ────────────────────────────────────────────────────────────────────────────
// Override déterministe des comptes de canaux par mode.
// `detectedModes` provient du microservice (comptage exact par colonne du
// tableau parallèle).
//
// Stratégie :
//   - Si detectedModes contient >= 2 modes structurés → on REMPLACE
//     ENTIÈREMENT la liste IA. Les comptes par colonne sont sourcés du
//     tableau lui-même, donc plus fiables que les comptes IA, ET ça élimine
//     les modes parasites halluciés par l'IA (cas Cobra où "Zoom mode:"
//     dans une cellule Function devient un faux mode).
//   - Si detectedModes a 0 ou 1 mode (cas Viper, X4 Bar, Spiider, Helix
//     etc.) → on garde le résultat IA comme fallback.
function applyDetectedModesOverride(iaModes, detectedModes) {
  if (!Array.isArray(detectedModes) || detectedModes.length < 2) {
    return iaModes;
  }
  console.log(
      `detected_modes override: replacing IA list (${iaModes.length} modes) `
      + `with ${detectedModes.length} modes from table column counting`);
  // Garde les NOMS IA quand on peut les fuzzy-matcher (parce que l'IA produit
  // souvent "Mode basique 16 bits Nch" qui est plus explicite que "St" du
  // detected_mode). Sinon, utilise expanded_name du detected.
  const normalize = (s) =>
    String(s || '')
      .toLowerCase()
      .normalize('NFD')
      .replace(/[̀-ͯ]/g, '')
      .replace(/\bmode\b/g, '')
      .replace(/[^a-z0-9]+/g, ' ')
      .trim();
  return detectedModes.map((dm) => {
    const dmNorm1 = normalize(dm.label);
    const dmNorm2 = normalize(dm.expanded_name);
    let bestIaName = null;
    for (const m of iaModes) {
      const mNorm = normalize(m.name);
      if (
        (dmNorm1 && (mNorm.includes(dmNorm1) || dmNorm1.includes(mNorm))) ||
        (dmNorm2 && (mNorm.includes(dmNorm2) || dmNorm2.includes(mNorm)))
      ) {
        bestIaName = m.name;
        break;
      }
    }
    return {
      name: bestIaName || dm.expanded_name || dm.label,
      channels: dm.channels,
    };
  });
}

// Appel au microservice Cloud Run d'extraction de tables.
// Reçoit pdf_base64 et l'URL du service, renvoie { tabular_text, pages }.
// Throw si timeout ou réponse invalide — le caller doit catch et fallback.
async function fetchTabularText(pdfBase64, serviceUrl) {
  const controller = new AbortController();
  // 180s timeout : couvre cold start Cloud Run (~5s) + OCR Tesseract sur
  // 10-15 pages à 200 DPI (60-120s) + marge. Avant : 30s, ce qui timeoutait
  // systématiquement les PDF scannés (Clay Paky A.leda B-Eye/Wash) — le
  // worker abandonnait silencieusement et l'IA hallucinait les modes depuis
  // le nom de fixture. Sub-requests Cloudflare Workers : pas de limite stricte.
  const timeoutId = setTimeout(() => controller.abort(), 180000);
  try {
    const resp = await fetch(serviceUrl.replace(/\/$/, '') + '/extract', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ pdf_base64: pdfBase64, max_pages: 15 }),
      signal: controller.signal,
    });
    clearTimeout(timeoutId);
    if (!resp.ok) {
      throw new Error('HTTP ' + resp.status);
    }
    const data = await resp.json();
    if (!data || !data.success) throw new Error('service returned no data');
    return data;
  } catch (e) {
    clearTimeout(timeoutId);
    if (e.name === 'AbortError') throw new Error('Timeout (>30s)');
    throw e;
  }
}

function jsonErr(corsHeaders, status, message, extra) {
  return new Response(JSON.stringify({ error: message, ...(extra || {}) }), {
    status, headers: { ...corsHeaders, 'Content-Type': 'application/json' }
  });
}

function escapeXml(s) {
  return String(s).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;').replace(/'/g, '&apos;');
}

// ────────────────────────────────────────────────────────────────────────────
//  Multi-column parser (cas Robe SPIIDER, première ligne "dmx protocol")
//  — INCHANGÉ par rapport à la version de prod, on ne casse pas ce qui marche.
// ────────────────────────────────────────────────────────────────────────────
function tryParseMultiColumnToXml(text) {
  const lines = text.split('\n').map(l => l.trim()).filter(l => l);
  const allModes = {};
  let currentModeNums = null;
  let pendingChNums = null;
  let lastChannels = null;
  let found = false;

  function parseConsecutiveStr(str) {
    const nums = [];
    let pos = 0;
    while (pos < str.length) {
      let pushed = false;
      if (pos + 1 < str.length) {
        const d2 = parseInt(str.substring(pos, pos + 2));
        const expected = nums.length === 0 ? d2 : nums[nums.length - 1] + 1;
        if (d2 === expected && d2 >= 1 && d2 <= 20) {
          const d1 = parseInt(str[pos]);
          const exp1 = nums.length === 0 ? d1 : nums[nums.length - 1] + 1;
          if (d1 !== exp1) { nums.push(d2); pos += 2; pushed = true; }
        }
      }
      if (!pushed) {
        const d1 = parseInt(str[pos]);
        const expected = nums.length === 0 ? d1 : nums[nums.length - 1] + 1;
        if (d1 !== expected || d1 < 1 || d1 > 9) return null;
        nums.push(d1); pos += 1;
      }
    }
    return nums.length >= 2 ? nums : null;
  }

  function parseTokens(str, N) {
    if (!/^[\d*]+$/.test(str)) return null;
    function parse(pos, remaining) {
      if (remaining === 0) return pos === str.length ? [] : null;
      if (pos >= str.length) return null;
      const c = str[pos];
      if (c === '*') {
        const rest = parse(pos + 1, remaining - 1);
        if (rest !== null) return ['*', ...rest];
        return null;
      }
      if (/\d/.test(c)) {
        if (pos + 1 < str.length && /\d/.test(str[pos + 1])) {
          const n2 = parseInt(str.substring(pos, pos + 2));
          if (n2 >= 1 && n2 <= 512) {
            const rest = parse(pos + 2, remaining - 1);
            if (rest !== null) return [String(n2), ...rest];
          }
        }
        if (pos + 2 < str.length && /\d/.test(str[pos + 1]) && /\d/.test(str[pos + 2])) {
          const n3 = parseInt(str.substring(pos, pos + 3));
          if (n3 >= 1 && n3 <= 512) {
            const rest = parse(pos + 3, remaining - 1);
            if (rest !== null) return [String(n3), ...rest];
          }
        }
        const n1 = parseInt(c);
        if (n1 >= 1) {
          const rest = parse(pos + 1, remaining - 1);
          if (rest !== null) return [String(n1), ...rest];
        }
      }
      return null;
    }
    return parse(0, N);
  }

  function interpolatePixelChannels(channels) {
    const pixelPattern = /^(.*?\s+pixel)\s+(\d+)$/i;
    const groups = {};
    for (const ch of channels) {
      const m = ch.name.match(pixelPattern);
      if (m) {
        const base = m[1].trim();
        const pixNum = parseInt(m[2]);
        if (!groups[base]) groups[base] = [];
        groups[base].push({ pixNum, num: ch.num, func: ch.func });
      }
    }
    const toAdd = [];
    for (const [base, items] of Object.entries(groups)) {
      items.sort((a, b) => a.pixNum - b.pixNum);
      const first = items.find(i => i.pixNum === 1);
      const last = items[items.length - 1];
      if (!first || last.pixNum <= 1) continue;
      const N = last.pixNum;
      const span = last.num - first.num;
      if (span <= 0) continue;
      const step = span / (N - 1);
      if (!Number.isInteger(step) || step <= 0) continue;
      const existing = new Set(items.map(i => i.pixNum));
      for (let p = 2; p < N; p++) {
        if (!existing.has(p)) {
          toAdd.push({
            num: first.num + (p - 1) * step,
            name: `${base} ${p}`,
            func: first.func
          });
        }
      }
    }
    if (toAdd.length === 0) return channels;
    return [...channels, ...toAdd].sort((a, b) => a.num - b.num);
  }

  function parseModeHeader(line) {
    const parts = line.split(/\s+/).filter(p => p);
    if (parts.length >= 2 && parts.length <= 10 && parts.every(p => /^\d+$/.test(p))) {
      const nums = parts.map(Number);
      const cons = nums.every((n, i) => i === 0 || n === nums[i - 1] + 1);
      if (nums.every(n => n >= 1 && n <= 20) && cons) return nums;
    }
    if (parts.length === 1 && /^\d{2,10}$/.test(parts[0])) {
      return parseConsecutiveStr(parts[0]);
    }
    return null;
  }

  function parseChannelRow(line, N) {
    const parts = line.split(/\s+/).filter(p => p);
    if (parts.length > N && parts.slice(0, N).every(p => p === '*' || (/^\d+$/.test(p) && parseInt(p) >= 1)) && parts[N] !== '-') {
      return { nums: parts.slice(0, N), name: parts.slice(N).join(' '), inline: true };
    }
    if (parts.length === 1 && /^[\d*]+$/.test(parts[0])) {
      const tokens = parseTokens(parts[0], N);
      if (tokens && tokens.some(t => t !== '*')) {
        return { nums: tokens, name: null, inline: false };
      }
    }
    return null;
  }

  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];
    const modeNums = parseModeHeader(line);
    if (modeNums) {
      currentModeNums = modeNums;
      for (const n of modeNums) { if (!allModes[n]) allModes[n] = []; }
      pendingChNums = null; lastChannels = null; found = true;
      continue;
    }
    if (!currentModeNums) continue;
    const N = currentModeNums.length;
    if (pendingChNums) {
      const chName = line;
      if (!/^\d/.test(chName) && chName.length > 1 && !chName.startsWith('Page') && !chName.startsWith('DMX') && !chName.startsWith('Mode') && !chName.startsWith('If ') && chName !== 'step' && chName !== 'proportional') {
        lastChannels = [];
        for (let j = 0; j < N; j++) {
          if (pendingChNums[j] !== '*') {
            const num = parseInt(pendingChNums[j]);
            allModes[currentModeNums[j]].push({ num, name: chName, func: '' });
            lastChannels.push({ modeNum: currentModeNums[j], idx: allModes[currentModeNums[j]].length - 1 });
          }
        }
      }
      pendingChNums = null;
      continue;
    }
    const chRow = parseChannelRow(line, N);
    if (chRow) {
      if (chRow.inline) {
        lastChannels = [];
        for (let j = 0; j < N; j++) {
          if (chRow.nums[j] !== '*') {
            const num = parseInt(chRow.nums[j]);
            allModes[currentModeNums[j]].push({ num, name: chRow.name, func: '' });
            lastChannels.push({ modeNum: currentModeNums[j], idx: allModes[currentModeNums[j]].length - 1 });
          }
        }
      } else {
        pendingChNums = chRow.nums; lastChannels = null;
      }
      continue;
    }
    const skipWords = new Set(['step', 'proportional']);
    const isPageHeader = /^Page \d+$/.test(line) || line === 'DMX protocol';
    if (lastChannels && !isPageHeader && !skipWords.has(line)) {
      const startsWithDigit = /^\d/.test(line);
      const isDescText = !startsWithDigit && line.length > 2 && !line.startsWith('To activate') && !line.startsWith('and shutter') && !line.startsWith('menu items') && !line.startsWith('channel ') && !line.startsWith('The following') && !line.startsWith('is connected') && !line.startsWith('Corresponding');
      if (startsWithDigit || isDescText) {
        const clean = line.replace(/\s*(step|proportional)$/, '').trim();
        if (clean.length > 0) {
          for (const { modeNum, idx } of lastChannels) {
            const existing = allModes[modeNum][idx].func;
            if (existing === '') {
              allModes[modeNum][idx].func = clean;
            } else {
              if (existing.length < 200 && !existing.endsWith(clean)) {
                allModes[modeNum][idx].func = existing + ' | ' + clean;
              }
            }
          }
        }
      }
    }
  }

  if (!found) return null;
  const modeNums = Object.keys(allModes).map(Number).sort((a, b) => a - b);
  if (modeNums.length === 0) return null;

  let xml = '<Modes>\n';
  for (const modeNum of modeNums) {
    let channels = allModes[modeNum].sort((a, b) => a.num - b.num);
    if (channels.length === 0) continue;
    channels = interpolatePixelChannels(channels);
    xml += `<Mode>\n<ModeName>Mode ${modeNum} (${channels.length}ch)</ModeName>\n<Channels>\n`;
    for (let i = 0; i < channels.length; i++) {
      const ch = channels[i];
      const nameLower = ch.name.toLowerCase();
      let res = '8bit';
      if (nameLower.includes('fine') || nameLower.includes('lsb') || nameLower.includes('16bit') || nameLower.includes('16 bit')) {
        res = '16bit-fine';
      } else if (i + 1 < channels.length) {
        const nextName = channels[i + 1].name.toLowerCase();
        if (nextName.includes('fine') || nextName.includes('lsb')) res = '16bit-coarse';
      }
      const cleanName = ch.name.replace(/\s*\(8\s*bit\)/gi, '').replace(/\s*\(16\s*bit\)/gi, '').replace(/\s*-\s*all pixels\*{0,3}/gi, '').trim();
      xml += `<Ch><Num>${ch.num}</Num><ChanName>${cleanName}</ChanName><Res>${res}</Res><Func>${ch.func || ''}</Func></Ch>\n`;
    }
    xml += `</Channels>\n</Mode>\n`;
  }
  xml += '</Modes>';
  return xml;
}
