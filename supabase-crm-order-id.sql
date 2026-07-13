-- Зовнішній номер замовлення LP-CRM («ID-o» в кабінеті).
-- Сайт генерує його при відправці замовлення в CRM (api/order.js → api/lpcrm.js)
-- і зберігає тут; калькулятор прибутку читає статуси замовлень із CRM за цими номерами.
-- Виконати в Supabase SQL Editor.

alter table orders add column if not exists crm_order_id text;
