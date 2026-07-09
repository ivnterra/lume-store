-- Окрема наскрізна нумерація звернень з форми зв'язку (type = 'contact').
-- Замовлення нумерацію не змінюють. Виконати в Supabase → SQL Editor одним блоком.

-- 1) колонка та лічильник
alter table public.orders add column if not exists lead_no integer;
create sequence if not exists public.lead_no_seq;

-- 2) проставляємо номери вже наявним зверненням (за порядком створення)
with numbered as (
  select id, row_number() over (order by id) as rn
  from public.orders
  where type = 'contact'
)
update public.orders o
set lead_no = numbered.rn
from numbered
where o.id = numbered.id and o.lead_no is null;

-- 3) лічильник продовжує з останнього виданого номера
select setval(
  'public.lead_no_seq',
  coalesce((select max(lead_no) from public.orders), 0),
  true
);

-- 4) кожне нове звернення отримує наступний номер автоматично
create or replace function public.set_lead_no()
returns trigger
language plpgsql
as $$
begin
  if new.type = 'contact' and new.lead_no is null then
    new.lead_no := nextval('public.lead_no_seq');
  end if;
  return new;
end;
$$;

drop trigger if exists orders_set_lead_no on public.orders;
create trigger orders_set_lead_no
before insert on public.orders
for each row execute function public.set_lead_no();
