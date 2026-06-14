-- ============================================================
--  LUMÉ — додати поле email до замовлень
--  Запустіть один раз: Supabase → SQL Editor → New query → Run
-- ============================================================

alter table public.orders add column if not exists email text;
