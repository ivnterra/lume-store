// Health-check реального стану бази (на відміну від api/order — той лише
// перевіряє, що функція жива, до Supabase не звертається).
// Для UptimeRobot: 200 = база відповідає, 500 = недоступна (квота/збій).
//
// Повідомлень у Telegram звідси НЕ шлемо — вимкнено на прохання власника
// 29.08.2026. Спроба слати пояснення при кожному падінні давала однакові
// повідомлення в групу «Leads | Talvyna» весь час збою (а він триває до
// відновлення квоти, тобто тижнями). Про падіння сповіщає UptimeRobot.
// У відповіді лишаємо `reason`, щоб причина була видна одразу при перевірці
// вручну: 402 — вичерпано квоту організації, решта — інша поломка.
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
      res.status(500).json({
        ok: false,
        status: r.status,
        reason: r.status === 402 ? 'quota exceeded' : 'error',
      });
      return;
    }
    res.status(200).json({ ok: true });
  } catch (e) {
    res.status(500).json({ ok: false, error: String((e && e.message) || e) });
  }
}
