-- ============================================================
--  TALVYNA — каталог: піжами
--  Джерело: картки постачальника (Tilda). Ціна для сайту — з робочої
--  таблиці; перекреслена ціна = ціна для сайту + 300 грн.
--  Кольори та наявність — з таблиці постачальника (1 = є, 0 = немає:
--  колір на сайті перекреслений).
--  Описи — авторські, за даними постачальника та фото картки.
--  Фото — у Supabase Storage (bucket product-images), формат webp.
--  Резервна копія: товари вже додано в базу.
-- ============================================================

insert into public.products
  (title, sku, category, price, old_price, badge, sizes, description,
   image_url, images, in_stock, published, store, variants, sort)
values
  ('Піжама з шортами «Ліана»', '41/12', 'Піжами', 849, 1149, null, '{"S-M","L-XL","2XL-3XL"}', 'Тканина в дрібний рубчик м''яко тягнеться й повторює рухи, тому в цій піжамі зручно і спати, і провести вечір удома. Топ на тонких бретелях застібається на маленькі ґудзики, а хвиляста мереживна облямівка по вирізу й низу шортів робить комплект ніжним без зайвого декору. Шорти сидять на м''якій гумці зі шнурком — талію легко підтягнути під себе. Бавовна дихає, тож уночі не спекотно.

Комплектація: топ, шорти
Матеріал: бавовняний стрейч у рубчик
Колір: чорний, рожевий, бордо, салатовий

Розмірна сітка:
S-M — ОГ 72-90 см, ОС 70-98 см
L-XL — ОГ 80-98 см, ОС 85-114 см
2XL-3XL — ОГ 95-108 см, ОС 95-126 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-12/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-12/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-12/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-12/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-12/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-12/5.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-12/6.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-12/7.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "рожевий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "бордо", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "салатовий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}]'::jsonb, 701),
  ('Атласна піжама «Тіара»', '41/14', 'Піжами', 799, 1099, null, '{"S-M","L-XL","2XL-3XL"}', 'Атлас тут працює на образ: він ловить світло, гладко ковзає по шкірі й одразу виглядає дорого. Топ вільного крою з фігурним вирізом облямований чорним мереживом, воно ж повторюється по низу шортів. Маленький бант на поясі додає комплекту грайливості. Шорти на м''якій гумці не тиснуть, а тонкі бретелі відкривають плечі — піжама, у якій приємно почуватися жіночно навіть удома.

Комплектація: топ, шорти
Матеріал: щільний атлас, мереживо
Колір: чорний, червоний, рожевий, срібло, бордо

Розмірна сітка:
S-M — ОГ 72-80 см, ОС 70-90 см
L-XL — ОГ 80-98 см, ОС 85-110 см
2XL-3XL — ОГ 95-102 см, ОС 90-120 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-14/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-14/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-14/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-14/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-14/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-14/5.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "червоний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "рожевий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "срібло", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "бордо", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}]'::jsonb, 702),
  ('Піжама з шортами «Соня»', '41/15', 'Піжами', 799, 1099, null, '{"S-M","L-XL","2XL-3XL"}', 'Напис good night на топі та картаті шорти з дрібними сердечками — комплект із тих, що піднімають настрій перед сном. Топ щільно сідає по фігурі й трохи вкорочений, шорти вільні, на гумці зі шнурком. Бавовняний стрейч приємний до тіла, добре тягнеться й тримає форму після прання. Проста, зручна піжама на щодень, у якій не шкода показатися вранці на кухні.

Комплектація: топ, шорти
Матеріал: бавовняний стрейч
Колір: чорний, білий

Розмірна сітка:
S-M — ОГ 72-94 см, ОС 70-102 см
L-XL — ОГ 80-102 см, ОС 85-118 см
2XL-3XL — ОГ 95-114 см, ОС 95-132 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-15/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-15/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-15/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-15/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-15/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-15/5.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": false, "sizes": [{"size": "S-M", "active": false}, {"size": "L-XL", "active": false}, {"size": "2XL-3XL", "active": false}]}, {"color": "білий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}]'::jsonb, 703),
  ('Атласна піжама «Мірабель»', '41/17', 'Піжами', 749, 1049, null, '{"S-M","L-XL"}', 'Контрастний рожевий кант по вирізу майки й по низу шортів — деталь, яка робить простий крій помітним. Майка вільна, з м''якою драпіровкою на грудях, не облягає й не стискає, шорти короткі, на широкій гумці. Щільний атлас прохолодний на дотик і приємно ковзає, тому в такій піжамі комфортно навіть теплої ночі. Комплект легкий, майже невагомий.

Комплектація: майка, шорти
Матеріал: щільний атлас
Колір: чорний, бордо, сірий

Розмірна сітка:
S-M — ОГ 75-86 см, ОС 74-98 см
L-XL — ОГ 82-94 см, ОС 94-106 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-17/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-17/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-17/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-17/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-17/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-17/5.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-17/6.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-17/7.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-17/8.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-17/9.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}]}, {"color": "бордо", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}]}, {"color": "сірий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}]}]'::jsonb, 704),
  ('Піжама з шортами «Емілі»', '41/18', 'Піжами', 749, 1049, null, '{"S-M","L-XL","2XL-3XL"}', 'Дрібні сердечка по всьому полотну й маленькі бантики на планці топа — комплект виглядає по-домашньому тепло. Контрастна окантовка підкреслює виріз, а хвилястий край шортів додає легкості. Тканина в рубчик еластична, добре сідає по фігурі й не сковує рухів. Шорти тримаються на м''якій гумці, тож у піжамі зручно спати в будь-якій позі.

Комплектація: топ, шорти
Матеріал: бавовняний стрейч у рубчик
Колір: чорний, рожевий

Розмірна сітка:
S-M — ОГ 72-86 см, ОС 72-98 см
L-XL — ОГ 80-96 см, ОС 82-110 см
2XL-3XL — ОГ 90-106 см, ОС 92-122 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-18/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-18/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-18/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-18/3.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "рожевий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}]'::jsonb, 705),
  ('Піжамний комплект «Валентина»', '41/23', 'Піжами', 749, 1049, null, '{"S-M","L-XL"}', 'Сердечка різного розміру розсипані по м''якому рубчику — піжама, яка одразу викликає усмішку. Топ на тонких бретелях трохи вкорочений, з хвилястим краєм, шорти вільні, на гумці з атласним бантом. Еластична тканина дає повну свободу рухів і приємно лягає по тілу. Такий комплект часто беруть у подарунок — він виглядає святково навіть у звичайний вечір.

Комплектація: топ, шорти
Матеріал: бавовняний стрейч у рубчик
Колір: білий, рожевий

Розмірна сітка:
S-M — ОГ 62-100 см, ОС 65-110 см
L-XL — ОГ 80-115 см, ОС 80-135 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-23/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-23/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-23/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-23/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-23/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-23/5.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-23/6.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-23/7.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-23/8.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-23/9.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-41-23/10.webp"}', true, true, 'talvyna', '[{"color": "білий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}]}, {"color": "рожевий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}]}]'::jsonb, 706),
  ('Атласна піжама «Феліція»', '11/44', 'Піжами', 749, 1049, null, '{"S-M","L-XL","2XL-3XL"}', 'Кожен колір цієї піжами має свій характер: губи, горошок, сердечка з написами чи леопардовий принт. Топ вільний, із глибоким вирізом, облямованим чорним мереживом, шорти короткі, теж із мереживною облямівкою по низу. Щільний атлас прохолодний на дотик і гарно спадає, не обтягуючи фігуру. Комплект помітний і легкий — саме той випадок, коли домашній одяг хочеться показати.

Комплектація: топ, шорти
Матеріал: щільний атлас, мереживо
Колір: чорний, червоний, синій, леопардовий

Розмірна сітка:
S-M — ОГ 72-88 см, ОС 70-96 см
L-XL — ОГ 80-104 см, ОС 85-108 см
2XL-3XL — ОГ 85-110 см, ОС 92-120 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-44/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-44/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-44/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-44/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-44/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-44/5.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-44/6.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-44/7.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-44/8.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-44/9.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "червоний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "синій", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "леопардовий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}]'::jsonb, 707),
  ('Мереживна піжама «Вероніка»', '11/53', 'Піжами', 749, 1049, null, '{"S-M","L-XL","2XL-3XL"}', 'Суцільне мереживо з квітковим візерунком і широка резинка на шортах — комплект більше схожий на комплект білизни, ніж на домашній одяг. Топ із поролончиками тримає форму грудей, тож його можна носити й окремо, наприклад під сорочку. Мереживо м''яко тягнеться й лягає по фігурі, а до набору додаються ще й мереживні трусики. Вибір кольорів широкий — від класичного чорного до жовтого й блакитного.

Комплектація: топ із поролончиками, шорти, мереживні трусики
Матеріал: мереживо
Колір: чорний, червоний, білий, рожевий, голубий

Розмірна сітка:
S-M — ОГ 72-88 см, ОС 70-96 см
L-XL — ОГ 80-98 см, ОС 85-108 см
2XL-3XL — ОГ 95-110 см, ОС 95-122 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-53/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-53/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-53/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-53/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-53/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-53/5.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-53/6.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-53/7.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-53/8.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-53/9.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "червоний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "білий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "рожевий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "голубий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}]'::jsonb, 708),
  ('Піжама з шортами «Кітті»', '11/71', 'Піжами', 749, 1049, null, '{"S-M","L-XL","2XL-3XL"}', 'Пудрово-рожевий комплект із сердечками й написами: топ на бретелях із ґудзиками спереду та шорти з білою мереживною облямівкою по низу. Бавовна зі стрейчем приємно холодить шкіру й добре тягнеться, тому піжама сідає по фігурі, але не тисне. Топ трохи вкорочений, шорти вільні, на м''якій гумці. Легкий, дівчачий комплект для спокійного вечора вдома.

Комплектація: топ, шорти
Матеріал: бавовна, стрейч
Колір: рожевий

Розмірна сітка:
S-M — ОГ 72-94 см, ОС 70-106 см
L-XL — ОГ 80-106 см, ОС 85-118 см
2XL-3XL — ОГ 95-116 см, ОС 95-134 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-71/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-71/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-71/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-71/3.webp"}', true, true, 'talvyna', '[{"color": "рожевий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}]'::jsonb, 709),
  ('Піжама з шортами «Клер»', '11/70', 'Піжами', 799, 1099, null, '{"S-M","L-XL","2XL-3XL"}', 'Однотонний топ у рубчик із ґудзиками на планці та картаті шорти в тон — поєднання, яке виглядає охайно й трохи по-американськи. Топ вкорочений, щільно сідає по фігурі, шорти вільні, на гумці зі шнурком, тому не залишають слідів на талії. Бавовна зі стрейчем прохолодна на дотик і добре тримає форму. Зручний варіант на щодень, який легко доповнити халатом.

Комплектація: топ, шорти
Матеріал: бавовна, стрейч
Колір: рожевий, синій, сірий

Розмірна сітка:
S-M — ОГ 72-92 см, ОС 70-96 см
L-XL — ОГ 80-100 см, ОС 85-108 см
2XL-3XL — ОГ 95-110 см, ОС 95-122 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-70/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-70/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-70/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-70/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-70/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-70/5.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-70/6.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-70/7.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-70/8.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pizh-11-70/9.webp"}', true, true, 'talvyna', '[{"color": "рожевий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "синій", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "сірий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}]'::jsonb, 710);
