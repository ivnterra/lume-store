// ВРЕМЕННЫЙ — перевірка запису в Google Sheet. Видалити після успішного тесту.
import { appendRows } from './gsheet.js';

export default async function handler(req, res) {
  if (req.query.t !== 'tlv-dbg-7031') return res.status(404).send('not found');
  try {
    const d = new Date();
    const dateStr = String(d.getDate()).padStart(2, '0') + '.' +
      String(d.getMonth() + 1).padStart(2, '0') + '.' + d.getFullYear();
    const result = await appendRows(
      '1DPZB24GYyzBfLQvEiAOiYSsuUdKYyQRa0Fo3pixVkLE',
      '1059855693',
      'D:Q',
      [[dateStr, 'ТЕСТ Іван (видалити рядок)', '', 'test@example.com', '', '', '', 'TEST-01', 'Тестовий товар', 'чорний', 'M', '', 999, '10%']]
    );
    res.status(200).json({ ok: true, result });
  } catch (e) {
    res.status(500).json({ ok: false, error: String(e && e.stack || e) });
  }
}
