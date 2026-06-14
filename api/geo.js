// Повертає код країни відвідувача за IP (із заголовків Vercel).
// Використовується на сайті для авто-вибору коду телефону в формі.
export default function handler(req, res) {
  const country = String(req.headers['x-vercel-ip-country'] || '').toLowerCase();
  res.setHeader('Cache-Control', 'no-store');
  res.status(200).json({ country: country || 'ua' });
}
