// ─────────────────────────────────────────────────────────────────────────────
// PATCH À APPLIQUER AU WORKER CLOUDFLARE EXISTANT
//
// Deux changements :
//  1. Dans le fetch handler principal, ajouter le routing GET AVANT le bloc
//     "if (request.method !== 'POST')".
//  2. Ajouter les trois fonctions GDTF Share en bas du fichier.
//
// Variables d'environnement à créer dans Cloudflare Dashboard
//   (Settings → Environment Variables → Add variable, type Secret) :
//
//   GDTF_USER      → ton identifiant gdtf-share.com
//   GDTF_PASSWORD  → ton mot de passe gdtf-share.com
//
// ─────────────────────────────────────────────────────────────────────────────


// ══════════════════════════════════════════════════════════════════════════════
// CHANGEMENT 1 — début du fetch handler
//
// Remplace ce bloc :
//
//   const corsHeaders = {
//     'Access-Control-Allow-Origin': '*',
//     'Access-Control-Allow-Methods': 'POST, OPTIONS',
//     'Access-Control-Allow-Headers': 'Content-Type',
//   };
//   if (request.method === 'OPTIONS') return new Response(null, { headers: corsHeaders });
//   if (request.method !== 'POST') return jsonErr(corsHeaders, 405, 'Méthode non autorisée');
//
// Par celui-ci :
// ══════════════════════════════════════════════════════════════════════════════

/*
    const corsHeaders = {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type',
    };
    if (request.method === 'OPTIONS') return new Response(null, { headers: corsHeaders });

    // ── Routes GET : GDTF Share search & download ──────────────────────────
    const url = new URL(request.url);
    if (request.method === 'GET') {
      if (url.pathname === '/search')  return gdtfSearch(url, env, corsHeaders);
      if (url.pathname === '/download') return gdtfDownload(url, env, corsHeaders);
      return jsonErr(corsHeaders, 404, 'Route inconnue');
    }

    if (request.method !== 'POST') return jsonErr(corsHeaders, 405, 'Méthode non autorisée');
*/


// ══════════════════════════════════════════════════════════════════════════════
// CHANGEMENT 2 — fonctions à ajouter à la fin du fichier Worker
// (après tryParseMultiColumnToXml et avant la dernière accolade fermante
//  si tu as un module pattern, ou juste avant la fin du fichier)
// ══════════════════════════════════════════════════════════════════════════════

const GDTF_API = 'https://gdtf-share.com/apis/public';

// Cache mémoire de la liste complète (dure la durée de vie de l'instance Worker,
// typiquement 5-15 min). Au-delà, on re-fetch automatiquement.
let _gdtfListCache = null;
let _gdtfListCachedAt = 0;
const LIST_TTL_MS = 10 * 60 * 1000; // 10 minutes

async function gdtfLogin(env) {
  const res = await fetch(`${GDTF_API}/login.php`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ user: env.GDTF_USER, password: env.GDTF_PASSWORD }),
    redirect: 'manual',
  });
  // L'API renvoie 200 avec set-cookie, parfois 302 selon le serveur.
  const raw = res.headers.get('set-cookie') ?? '';
  const cookie = raw.split(';')[0].trim();
  if (!cookie) throw new Error('Login GDTF Share échoué (pas de cookie). Vérifie GDTF_USER / GDTF_PASSWORD.');
  return cookie;
}

async function gdtfGetList(env) {
  const now = Date.now();
  if (_gdtfListCache && now - _gdtfListCachedAt < LIST_TTL_MS) return _gdtfListCache;

  const cookie = await gdtfLogin(env);
  const res = await fetch(`${GDTF_API}/getList.php`, {
    headers: { Cookie: cookie },
  });
  if (!res.ok) throw new Error(`getList HTTP ${res.status}`);
  const data = await res.json();
  if (!data.result) throw new Error(data.error ?? 'getList: result=false');

  _gdtfListCache = data.list ?? [];
  _gdtfListCachedAt = now;
  return _gdtfListCache;
}

// GET /search?q=ayrton
async function gdtfSearch(url, env, corsHeaders) {
  const q = (url.searchParams.get('q') ?? '').trim().toLowerCase();
  if (!q) return Response.json({ results: [] }, { headers: corsHeaders });

  try {
    const list  = await gdtfGetList(env);
    const terms = q.split(/\s+/);
    const hits  = list.filter(f => {
      const hay = `${f.manufacturer} ${f.fixture}`.toLowerCase();
      return terms.every(t => hay.includes(t));
    });
    return new Response(
      JSON.stringify({ results: hits.slice(0, 50) }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } },
    );
  } catch (err) {
    return new Response(
      JSON.stringify({ error: err.message }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } },
    );
  }
}

// GET /download?rid=12345
async function gdtfDownload(url, env, corsHeaders) {
  const rid = url.searchParams.get('rid');
  if (!rid) {
    return new Response(JSON.stringify({ error: 'Paramètre rid manquant' }),
      { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } });
  }

  try {
    const cookie = await gdtfLogin(env);
    const res = await fetch(`${GDTF_API}/downloadFile.php?rid=${encodeURIComponent(rid)}`, {
      headers: { Cookie: cookie },
    });
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
    return new Response(
      JSON.stringify({ error: err.message }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } },
    );
  }
}
