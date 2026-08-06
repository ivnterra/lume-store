// Vercel Serverless Function — динамічний sitemap.xml для Google Search Console.
// Доступний за чистим адресом /sitemap.xml (через rewrite у vercel.json).
// Читає товари з Supabase, тож оновлюється автоматично при зміні каталогу.
//
// Змінні оточення Vercel:
//   SUPABASE_URL               — URL проєкту Supabase
//   SUPABASE_SERVICE_ROLE_KEY  — ключ (необов'язково; товари читаються публічно)

const SITE = 'https://talvyna.com';
const ANON_FALLBACK = 'sb_publishable_agwV8VZz7vSQ_xQSONg22w_upAe5lQA';

// --- транслітерація / slug (1:1 з index.html та api/feed.js) ---
function translit(s) {
  const map = { 'а':'a','б':'b','в':'v','г':'h','ґ':'g','д':'d','е':'e','є':'ie','ж':'zh','з':'z',
    'и':'y','і':'i','ї':'i','й':'i','к':'k','л':'l','м':'m','н':'n','о':'o','п':'p','р':'r','с':'s',
    'т':'t','у':'u','ф':'f','х':'kh','ц':'ts','ч':'ch','ш':'sh','щ':'shch','ь':'','ю':'iu','я':'ia',
    'ъ':'','ы':'y','э':'e','ё':'e' };
  return String(s).toLowerCase().split('').map(ch => map[ch] !== undefined ? map[ch] : ch).join('');
}
function slugify(s) {
  return translit(s)
    .replace(/[«»"'’”“]/g, '')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/-{2,}/g, '-')
    .replace(/^-+|-+$/g, '');
}
function skuToUrl(sku) {
  return String(sku || '').trim().toLowerCase()
    .replace(/[\/\s]+/g, '-').replace(/[^a-z0-9\-]/g, '')
    .replace(/-{2,}/g, '-').replace(/^-+|-+$/g, '');
}
function productSlug(p) {
  const s = skuToUrl(p.sku) || String(p.id);
  const t = slugify(p.title || '');
  return t ? (s + '-' + t) : s;
}
function xmlEsc(s) {
  return String(s == null ? '' : s)
    .replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;').replace(/'/g, '&apos;');
}
function ymd(v) {
  const d = v ? new Date(v) : new Date();
  return isNaN(d) ? new Date().toISOString().slice(0, 10) : d.toISOString().slice(0, 10);
}

function urlNode(loc, lastmod, priority) {
  return '  <url>\n' +
    '    <loc>' + xmlEsc(loc) + '</loc>\n' +
    (lastmod ? '    <lastmod>' + lastmod + '</lastmod>\n' : '') +
    (priority ? '    <priority>' + priority + '</priority>\n' : '') +
    '  </url>';
}

export default async function handler(req, res) {
  const SB = process.env.SUPABASE_URL || 'https://gwzywunqffubbmscmgam.supabase.co';
  const KEY = process.env.SUPABASE_SERVICE_ROLE_KEY || ANON_FALLBACK;

  try {
    const endpoint = SB.replace(/\/$/, '') +
      '/rest/v1/products?select=*&store=eq.talvyna&order=sort.asc,id.asc';
    const resp = await fetch(endpoint, { headers: { apikey: KEY, Authorization: 'Bearer ' + KEY } });
    if (!resp.ok) throw new Error('Supabase HTTP ' + resp.status);
    const products = await resp.json();
    if (!Array.isArray(products)) throw new Error('Unexpected response');

    const today = ymd();
    const nodes = [urlNode(SITE + '/', today, '1.0')];
    products.forEach(p => {
      if (p.published === false) return; // прихований товар не індексуємо
      nodes.push(urlNode(SITE + '/product/' + productSlug(p), ymd(p.created_at), '0.8'));
    });

    const xml = '<?xml version="1.0" encoding="UTF-8"?>\n' +
      '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n' +
      nodes.join('\n') + '\n</urlset>\n';

    res.setHeader('Content-Type', 'application/xml; charset=utf-8');
    res.setHeader('Cache-Control', 's-maxage=3600, stale-while-revalidate=600');
    res.status(200).send(xml);
  } catch (e) {
    res.status(500).json({ error: String((e && e.message) || e) });
  }
}
