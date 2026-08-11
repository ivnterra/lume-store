// Vercel Serverless Function — товарний фід для Meta (Facebook/Instagram) Commerce каталогу.
// Віддає XML (RSS 2.0 з namespace g:) — Meta забирає його за розкладом за URL:
//     https://talvyna.com/api/feed
// Додатково підтримує CSV для ручного завантаження:  /api/feed?format=csv
//
// Рівень деталізації: ВАРІАНТНИЙ — кожна комбінація колір+розмір окремим рядком
// з єдиним item_group_id (= артикул). Наявність береться з variants[].active.
//
// Змінні оточення Vercel:
//   SUPABASE_URL               — URL проєкту Supabase
//   SUPABASE_SERVICE_ROLE_KEY  — ключ (необов'язково; товари читаються публічно)

const SITE = 'https://talvyna.com';
const CURRENCY = 'UAH';
const BRAND = 'Talvyna';

// Мітка магазину для сегментації в рекламі (Google Ads / Meta) -> custom_label_1.
// Визначається за доменом: піддомен majestic — 'majestic'; основний talvyna — 'talvyna'.
const LINE = /majestic\./i.test(SITE) ? 'majestic' : 'talvyna';

// anon publishable-ключ публічний (товари мають RLS "public read") — безпечний фолбек,
// щоб фід працював навіть без service-role у середовищі.
const ANON_FALLBACK = 'sb_publishable_agwV8VZz7vSQ_xQSONg22w_upAe5lQA';

// --- Категорія магазину -> Google product category (числові ID таксономії Google) ---
//  Купальники / Накидки -> Swimwear (5250); Сукні -> Dresses (2271);
//  Халати -> Robes (2302); Піжами -> Pajamas (2580); Пеньюари -> Nightgowns (5513);
//  Верх -> Shirts & Tops (212); Низ -> Clothing (1604); Аксесуари -> Clothing Accessories (167).
const GOOGLE_CAT = {
  'Купальники': '5250',
  'Пляжні накидки': '5250',
  'Накидки': '5250',
  'Халати': '2302',
  'Піжами': '2580',
  'Пеньюари': '5513',
  'Сукні': '2271',
  'Верх': '212',
  'Низ': '1604',
  'Аксесуари': '167'
};
const GOOGLE_CAT_DEFAULT = '1604'; // Apparel & Accessories > Clothing

// --- транслітерація / slug (1:1 з логікою вітрини index.html) ---
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
function productLink(p) { return SITE + '/product/' + productSlug(p); }

function priceStr(n) { return (Number(n) || 0).toFixed(2) + ' ' + CURRENCY; }

// Meta вимагає JPEG/PNG для головного фото товару; сайт віддає webp (легше і швидше
// для відвідувачів). Для фіду прописуємо ту саму картинку через wsrv.nl — безкоштовний
// проксі-конвертер на лету (кешується на його CDN), сайту та завантаженню фото це не
// торкається.
function toJpg(url) {
  if (!url || !/\.webp(\?.*)?$/i.test(url)) return url;
  return 'https://wsrv.nl/?url=' + encodeURIComponent(url) + '&output=jpg';
}

function cleanText(s, max) {
  const t = String(s || '').replace(/<[^>]*>/g, ' ').replace(/\s+/g, ' ').trim();
  return max ? t.slice(0, max) : t;
}
function xmlEsc(s) {
  return String(s == null ? '' : s)
    .replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;').replace(/'/g, '&apos;');
}

// Перетворює товар у рядок фіду (одна позиція = одна картка товару).
function expand(p) {
  const rows = [];
  const link = productLink(p);
  const images = (Array.isArray(p.images) && p.images.length) ? p.images
    : (p.image_url ? [p.image_url] : []);
  const imageLink = toJpg(images[0] || '');
  const extra = images.slice(1, 11).map(toJpg); // Meta: до 10 additional_image_link
  const productInStock = p.in_stock !== false;
  const desc = cleanText(p.description, 5000) ||
    cleanText((p.title || '') + '. ' + (p.category || '') + '. Бренд ' + BRAND, 5000);
  const googleCat = GOOGLE_CAT[p.category] || GOOGLE_CAT_DEFAULT;

  // ціна / акція: price = поточна, old_price = перекреслена.
  // Meta: g:price = звичайна (стара), g:sale_price = акційна (поточна).
  const hasSale = p.old_price && Number(p.old_price) > Number(p.price);
  const regularPrice = hasSale ? p.old_price : p.price;
  const salePrice = hasSale ? p.price : null;

  // Наявність на рівні товару: in stock, якщо товар активний і є хоча б один
  // доступний варіант (колір+розмір). Якщо всі варіанти вимкнені — out of stock.
  const variants = Array.isArray(p.variants) ? p.variants : [];
  let anyActive;
  if (variants.length) {
    anyActive = variants.some(v => v.active !== false && (
      !Array.isArray(v.sizes) || !v.sizes.length
        ? true
        : v.sizes.some(sz => sz.active !== false)
    ));
  } else {
    const sizes = Array.isArray(p.sizes) ? p.sizes : [];
    const oos = Array.isArray(p.oos_sizes) ? p.oos_sizes : [];
    anyActive = !sizes.length || sizes.some(s => !oos.includes(s));
  }
  const inStock = productInStock && anyActive;

  // одна позиція = одна картка товару (без розбивки по кольору/розміру)
  rows.push({
    id: skuToUrl(p.sku) || String(p.id),
    title: cleanText(p.title, 200),
    description: desc,
    link, image_link: imageLink, extra,
    availability: inStock ? 'in stock' : 'out of stock',
    brand: BRAND, condition: 'new', gender: 'female', age_group: 'adult',
    google_product_category: googleCat,
    // категорія магазину — для розподілу на набори в Meta (product set)
    product_type: p.category || '',
    custom_label_0: p.category || '',
    custom_label_1: LINE,
    price: priceStr(regularPrice),
    sale_price: salePrice != null ? priceStr(salePrice) : null,
    sku: p.sku || ''
  });
  return rows;
}

function rowToXml(r) {
  const t = [];
  const g = (k, v) => { if (v !== '' && v != null) t.push('      <g:' + k + '>' + xmlEsc(v) + '</g:' + k + '>'); };
  t.push('    <item>');
  g('id', r.id);
  g('title', r.title);
  g('description', r.description);
  t.push('      <link>' + xmlEsc(r.link) + '</link>');
  g('image_link', r.image_link);
  (r.extra || []).forEach(u => g('additional_image_link', u));
  g('availability', r.availability);
  g('condition', r.condition);
  g('price', r.price);
  if (r.sale_price) g('sale_price', r.sale_price);
  g('brand', r.brand);
  g('mpn', r.sku);
  g('google_product_category', r.google_product_category);
  g('product_type', r.product_type);
  g('custom_label_0', r.custom_label_0);
  g('custom_label_1', r.custom_label_1);
  g('gender', r.gender);
  g('age_group', r.age_group);
  t.push('    </item>');
  return t.join('\n');
}

function buildXml(rows) {
  const head =
    '<?xml version="1.0" encoding="UTF-8"?>\n' +
    '<rss version="2.0" xmlns:g="http://base.google.com/ns/1.0">\n' +
    '  <channel>\n' +
    '    <title>Talvyna — товарний фід</title>\n' +
    '    <link>' + SITE + '</link>\n' +
    '    <description>Каталог товарів Talvyna для Meta Commerce</description>\n';
  const body = rows.map(rowToXml).join('\n');
  return head + body + '\n  </channel>\n</rss>\n';
}

function buildCsv(rows) {
  const cols = ['id', 'title', 'description', 'availability', 'condition',
    'price', 'sale_price', 'link', 'image_link', 'additional_image_link', 'brand', 'mpn',
    'google_product_category', 'product_type', 'custom_label_0', 'custom_label_1', 'gender', 'age_group'];
  const q = v => '"' + String(v == null ? '' : v).replace(/"/g, '""') + '"';
  const lines = [cols.join(',')];
  rows.forEach(r => {
    const m = {
      id: r.id, title: r.title, description: r.description,
      availability: r.availability, condition: r.condition, price: r.price,
      sale_price: r.sale_price || '', link: r.link, image_link: r.image_link,
      additional_image_link: (r.extra || []).join(','), brand: r.brand, mpn: r.sku,
      google_product_category: r.google_product_category,
      product_type: r.product_type, custom_label_0: r.custom_label_0,
      custom_label_1: r.custom_label_1,
      gender: r.gender, age_group: r.age_group
    };
    lines.push(cols.map(c => q(m[c])).join(','));
  });
  return lines.join('\n') + '\n';
}

export default async function handler(req, res) {
  const SB = process.env.SUPABASE_URL || 'https://gwzywunqffubbmscmgam.supabase.co';
  const KEY = process.env.SUPABASE_SERVICE_ROLE_KEY || ANON_FALLBACK;
  const format = String((req.query && req.query.format) || '').toLowerCase();

  try {
    // select=* — стійко до відсутніх колонок (напр. oos_sizes ще може бути не створено)
    const endpoint = SB.replace(/\/$/, '') +
      '/rest/v1/products?select=*&store=eq.talvyna&order=sort.asc,id.asc';
    let products;
    try {
      const resp = await fetch(endpoint, { headers: { apikey: KEY, Authorization: 'Bearer ' + KEY } });
      if (!resp.ok) throw new Error('Supabase HTTP ' + resp.status);
      products = await resp.json();
      if (!Array.isArray(products)) throw new Error('Unexpected response');
    } catch (e) {
      // Аварійний фолбек: Supabase недоступний (напр. вичерпано egress-квоту) —
      // беремо статичний знімок каталогу з Meta. Видалити після відновлення Supabase.
      const staticResp = await fetch(SITE + '/static-catalog/products.json');
      if (!staticResp.ok) throw e;
      const staticProducts = await staticResp.json();
      products = staticProducts.map(p => ({
        ...p,
        images: (p.images || []).map(u => u.startsWith('http') ? u : SITE + u),
        image_url: p.image_url && !p.image_url.startsWith('http') ? SITE + p.image_url : p.image_url
      }));
    }

    // лише товари з валідним посиланням і фото
    const rows = [];
    products.forEach(p => {
      if (p.published === false) return; // прихований в адмінці — у рекламний фід не потрапляє
      const imgs = (Array.isArray(p.images) && p.images.length) ? p.images : (p.image_url ? [p.image_url] : []);
      if (!imgs.length) return; // Meta вимагає image_link — без фото пропускаємо
      expand(p).forEach(r => { if (r.id && r.image_link) rows.push(r); });
    });

    // 30 хв кеш на CDN Vercel — Meta все одно тягне за розкладом
    res.setHeader('Cache-Control', 's-maxage=1800, stale-while-revalidate=600');

    if (format === 'csv') {
      res.setHeader('Content-Type', 'text/csv; charset=utf-8');
      res.status(200).send(buildCsv(rows));
      return;
    }
    res.setHeader('Content-Type', 'application/xml; charset=utf-8');
    res.status(200).send(buildXml(rows));
  } catch (e) {
    res.status(500).json({ error: String((e && e.message) || e) });
  }
}
