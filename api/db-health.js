// Health-check реального стану бази (на відміну від api/order — той лише
// перевіряє, що функція жива, до Supabase не звертається).
// Для UptimeRobot: 200 = база відповідає, 500 = недоступна (квота/збій).
export default async function handler(req, res) {
  const SB = process.env.SUPABASE_URL;
  const KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;
  res.setHeader('Cache-Control', 'no-store');

  if (!SB || !KEY) {
    res.status(500).json({ ok: false, reason: 'not configured' });
    return;
  }

  try {
    const r = await fetch(
      SB.replace(/\/$/, '') + '/rest/v1/products?select=id&limit=1',
      { headers: { apikey: KEY, Authorization: 'Bearer ' + KEY } }
    );
    if (!r.ok) {
      res.status(500).json({ ok: false, status: r.status });
      return;
    }
    res.status(200).json({ ok: true });
  } catch (e) {
    res.status(500).json({ ok: false, error: String((e && e.message) || e) });
  }
}
