-- ============================================================
--  TALVYNA — каталог: халати (нова категорія)
--  Джерело: картки постачальника (Tilda). Ціна для сайту — з робочої
--  таблиці; перекреслена ціна = ціна для сайту + 300 грн.
--  Описи — авторські, за даними постачальника та фото картки.
--  Розмірна сітка нормалізована (ОГ/ОТ/ОС, латинські розміри).
--  Кольори та наявність — з таблиці постачальника (аркуш халатів).
--  Правило: розмір у кольорі доступний, якщо (наявність + резерв) >= 5,
--  інакше active:false — на сайті перекреслений.
--  Фото — у Supabase Storage (bucket product-images, шляхи hal-<код>/),
--  формат webp.
--  Запустити один раз: Supabase -> SQL Editor -> New query -> Run
-- ============================================================

insert into public.products
  (title, sku, category, price, old_price, badge, sizes, description,
   image_url, images, in_stock, published, store, variants, sort)
values
  ('Халат із пеньюаром і піжамою «Верона»', '226/11', 'Халати', 1349, 1649, null, '{"S-M","L-XL","2XL-3XL"}', 'Атлас у цьому наборі виглядає дорого: гладко ковзає по шкірі, тримає форму й м''яко світиться на згинах. Ніжне мереживо в тон облямовує рукави халата та виріз пеньюара, тож усі предмети сприймаються як одне ціле. Бретельки регулюються по висоті — ліф сідає саме так, як зручно. З набору легко скласти різні образи: від легкого пеньюара на вечір до теплішого варіанта зі штанами прохолодного ранку.

Комплектація: халат, пеньюар, пояс, штани, піжамний комплект-двійка
Матеріал: щільний атлас, мереживо
Колір: чорний, рожевий, сірий, синій, бордо

Розмірна сітка:
S-M — ОГ 70-88 см, ОС 80-92 см
L-XL — ОГ 85-102 см, ОС 86-110 см
2XL-3XL — ОГ 80-116 см, ОС 102-124 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-226-11/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-226-11/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-226-11/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-226-11/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-226-11/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-226-11/5.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "рожевий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "сірий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "синій", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "бордо", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}]'::jsonb, 601),
  ('Халат із пеньюаром і піжамою «Равенна»', '226/14', 'Халати', 1449, 1749, null, '{"S-M","L-XL","2XL-3XL"}', 'Контрастне мереживо — головна деталь набору: воно окреслює виріз пеньюара й топа, лягає широкою смугою по низу халата, на рукавах і шортах. Щільний м''який атлас спадає рівними складками та приємно ковзає по шкірі, а вільний крій халата не стискає рухів. Бретельки регулюються по висоті, тож глибину декольте можна підібрати під себе. З цих речей складається і затишний домашній образ, і вечірній.

Комплектація: халат, пеньюар, пояс, штани, піжамний комплект-двійка
Матеріал: щільний м''який атлас, мереживо
Колір: чорний, білий, червоний, рожевий, синій

Розмірна сітка:
S-M — ОГ 75-86 см, ОС 86-98 см
L-XL — ОГ 90-95 см, ОС 95-110 см
2XL-3XL — ОГ 80-116 см, ОС 102-124 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-226-14/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-226-14/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-226-14/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-226-14/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-226-14/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-226-14/5.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-226-14/6.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-226-14/7.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-226-14/8.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "білий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": false}]}, {"color": "червоний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "рожевий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": false}]}, {"color": "синій", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": false}]}]'::jsonb, 602),
  ('Довгий атласний халат «Ліон»', '222/15П', 'Халати', 849, 1149, null, '{"S","M","L","XL"}', 'Халат спадає до самої підлоги, а пояс на талії збирає силует — виходить майже сукня. Широкі рукави з французького мережива додають прозорості й руху, мереживна смуга по низу продовжує цю лінію донизу. Щільний атлас переливається на світлі та лягає м''якими складками при кожному кроці. Модель однаково доречна вдома, на ранкових зборах нареченої чи для фотосесії.

Комплектація: халат, пояс
Матеріал: щільний атлас, французьке мереживо
Колір: чорний, білий, червоний

Довжина халата 140 см, довжина рукава 57 см

Розмірна сітка:
S — ОГ 70-82 см, ОТ 60-70 см, ОС 80-92 см
M — ОГ 75-86 см, ОТ 65-70 см, ОС 85-97 см
L — ОГ 80-92 см, ОТ 65-75 см, ОС 90-106 см
XL — ОГ 80-96 см, ОТ 70-85 см, ОС 95-114 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-222-15p/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-222-15p/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-222-15p/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-222-15p/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-222-15p/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-222-15p/5.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-222-15p/6.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}, {"size": "XL", "active": true}]}, {"color": "білий", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}, {"size": "XL", "active": true}]}, {"color": "червоний", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}, {"size": "XL", "active": true}]}]'::jsonb, 603),
  ('Халат із пеньюаром і піжамою «Аделіна»', '226/12', 'Халати', 1299, 1599, null, '{"S-M","L-XL","2XL-3XL"}', 'Сріблясте мереживо контрастує з насиченим кольором атласу: воно лягає по вирізу пеньюара, на рукавах халата й по низу шортів, роблячи набір помітним навіть у деталях. Тканина щільна, з м''яким блиском — гарно тримається на фігурі й не просвічує. Бретельки регулюються по висоті, а вільний халат зручно накинути поверх пеньюара, коли хочеться більше затишку.

Комплектація: халат, пеньюар, пояс, штани, піжамний комплект-двійка
Матеріал: щільний атлас, мереживо
Колір: чорний, червоний, зелений, рожевий

Розмірна сітка:
S-M — ОГ 70-88 см, ОС 80-92 см
L-XL — ОГ 85-102 см, ОС 86-110 см
2XL-3XL — ОГ 80-116 см, ОС 102-124 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-226-12/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-226-12/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-226-12/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-226-12/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-226-12/4.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "червоний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "зелений", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "рожевий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}]'::jsonb, 604),
  ('Довгий атласний халат «Канни»', '222/16П', 'Халати', 849, 1149, null, '{"S","M","L","XL"}', 'Широка смуга французького мережива по низу — те, заради чого варто вибрати цю модель: вона робить довгий поділ прозорим і додає руху при кожному кроці. Вільні мереживні рукави відкривають руки, а пояс дозволяє зібрати талію так, як зручно. Щільний атлас гладенько ковзає по шкірі й тримає форму, тож халат гарно сидить і не м''ється від першого руху.

Комплектація: халат, пояс
Матеріал: щільний атлас, французьке мереживо
Колір: чорний, білий, бордо

Довжина халата 140 см

Розмірна сітка:
S — ОГ 70-82 см, ОТ 60-70 см, ОС 80-92 см
M — ОГ 75-86 см, ОТ 65-70 см, ОС 85-97 см
L — ОГ 80-90 см, ОТ 65-75 см, ОС 90-106 см
XL — ОГ 80-94 см, ОТ 70-85 см, ОС 95-110 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-222-16p/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-222-16p/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-222-16p/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-222-16p/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-222-16p/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-222-16p/5.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-222-16p/6.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-222-16p/7.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-222-16p/8.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-222-16p/9.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-222-16p/10.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}, {"size": "XL", "active": true}]}, {"color": "білий", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}, {"size": "XL", "active": true}]}, {"color": "бордо", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}, {"size": "XL", "active": true}]}]'::jsonb, 605),
  ('Халат із пеньюаром «Белла»', '221/15', 'Халати', 999, 1299, null, '{"S","M","L","XL","2XL"}', 'Напівпрозорий комплект для особливого вечора: пеньюар на тонких бретелях із бантиком під грудьми, легка оборка по низу та халат із широкими мереживними рукавами. Тканина зі спандексом м''яко тягнеться й повторює рухи, а невагоме мереживо створює ледь помітний, розсіяний силует. Пеньюар регулюється за висотою, тож посадку легко підлаштувати під себе.

Комплектація: пеньюар, халат, пояс, стринги
Матеріал: мереживо, спандекс, нейлон
Колір: чорний, білий

Довжина халата 82 см

Розмірна сітка:
S — ОГ 70-80 см, ОС 75-85 см
M — ОГ 75-85 см, ОС 80-90 см
L — ОГ 80-95 см, ОС 85-95 см
XL — ОГ 82-100 см, ОС 90-110 см
2XL — ОГ 84-108 см, ОС 94-118 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-221-15/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-221-15/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-221-15/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-221-15/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-221-15/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-221-15/5.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-221-15/6.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-221-15/7.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-221-15/8.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}, {"size": "XL", "active": true}, {"size": "2XL", "active": true}]}, {"color": "білий", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}, {"size": "XL", "active": true}, {"size": "2XL", "active": true}]}]'::jsonb, 606),
  ('Халат із пеньюаром «Ізабель»', '221/12В', 'Халати', 749, 1049, null, '{"S","M","L","XL"}', 'Мереживний ліф із вкладками тримає форму грудей, а далі пеньюар спадає вільно й майже невагомо, з мереживною облямівкою по низу. Накидка з розкльошеними рукавами доповнює образ і знімається одним рухом. Мереживо зі спандексом делікатно тягнеться, тому комплект сідає по фігурі без стягування — у ньому легко почуватися впевнено.

Комплектація: пеньюар із вкладками, накидка, стринги
Матеріал: мереживо, спандекс
Колір: чорний, білий, червоний, рожевий, фіолетовий

Довжина накидки 85 см, довжина пеньюара 70 см

Розмірна сітка:
S — ОГ 70-80 см, ОС 75-85 см
M — ОГ 75-85 см, ОС 80-90 см
L — ОГ 80-95 см, ОС 85-95 см
XL — ОГ 85-100 см, ОС 90-110 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-221-12v/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-221-12v/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-221-12v/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-221-12v/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-221-12v/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-221-12v/5.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-221-12v/6.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-221-12v/7.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-221-12v/8.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": false, "sizes": [{"size": "S", "active": false}, {"size": "M", "active": false}, {"size": "L", "active": false}, {"size": "XL", "active": false}]}, {"color": "білий", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}, {"size": "XL", "active": true}]}, {"color": "червоний", "active": false, "sizes": [{"size": "S", "active": false}, {"size": "M", "active": false}, {"size": "L", "active": false}, {"size": "XL", "active": false}]}, {"color": "рожевий", "active": false, "sizes": [{"size": "S", "active": false}, {"size": "M", "active": false}, {"size": "L", "active": false}, {"size": "XL", "active": false}]}, {"color": "фіолетовий", "active": false, "sizes": [{"size": "S", "active": false}, {"size": "M", "active": false}, {"size": "L", "active": false}, {"size": "XL", "active": false}]}]'::jsonb, 607),
  ('Довгий атласний халат «Сакура»', '222/41', 'Халати', 899, 1199, null, '{"S-M","L-XL","2XL-3XL"}', 'Тонкий рослинний малюнок розсипаний по всьому полотну — гілочки піднімаються від низу до плеча й роблять халат схожим на кімоно. Глибокий запáх, пояс на талії та довгі рукави з м''яким об''ємом створюють спокійний, трохи східний силует. Атлас приємно важкий, тож модель рівно спадає й не задирається під час руху. Такий халат легко накинути і зранку за кавою, і ввечері поверх білизни.

Комплектація: халат, пояс
Матеріал: щільний м''який атлас
Колір: чорний, темно-бірюзовий, сірий

Довжина халата 117 см

Розмірна сітка:
S-M — ОГ 70-88 см, ОС 75-102 см
L-XL — ОГ 76-98 см, ОС 88-112 см
2XL-3XL — ОГ 86-108 см, ОС 94-124 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-222-41/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-222-41/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-222-41/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-222-41/3.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "темно-бірюзовий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "сірий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}]'::jsonb, 608),
  ('Атласний халат «Пантера»', '222/42', 'Халати', 899, 1199, null, '{"S","M","L"}', 'Леопардовий принт на щільному атласі — модель для тих, хто любить помітні речі. Чорне мереживо на манжетах і по вирізу підкреслює запáх, а об''ємні рукави з м''якими складками додають образу характеру. Тканина гладенька, з делікатним блиском, гарно тримає форму й ковзає по шкірі. Халат зав''язується поясом, тож глибину запáху легко відрегулювати під настрій.

Комплектація: халат, пояс
Матеріал: щільний атлас, мереживо
Колір: леопардовий

Розмірна сітка:
S — ОГ 74-92 см, ОС 80-98 см
M — ОГ 82-98 см, ОС 88-109 см
L — ОГ 88-108 см, ОС 94-118 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-222-42/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-222-42/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-222-42/2.webp"}', true, true, 'talvyna', '[{"color": "леопардовий", "active": true, "sizes": [{"size": "S", "active": false}, {"size": "M", "active": true}, {"size": "L", "active": true}]}]'::jsonb, 609),
  ('Халат із пеньюаром «Мілена»', '223/13', 'Халати', 949, 1249, null, '{"S","M","L","XL","2XL","3XL"}', 'Пара, у якій кожна річ працює на іншу: пеньюар із вкладками тримає лінію грудей, а халат із поясом закриває плечі, коли хочеться більше затишку. Мереживо йде по борту халата, на рукавах і по вирізу пеньюара, підкреслюючи глибину декольте. Щільний атлас лягає по фігурі м''яко, без зайвого обтягування, а бретельки регулюються по висоті — виріз сідає саме так, як зручно.

Комплектація: халат, пеньюар, пояс
Матеріал: щільний атлас, мереживо
Колір: рожевий, сірий, бордо, персиковий

Довжина халата 88-90 см, довжина пеньюара 78-80 см від плеча

Розмірна сітка:
S — ОГ 70-82 см, ОС 80-87 см
M — ОГ 75-88 см, ОС 85-96 см
L — ОГ 85-96 см, ОС 90-110 см
XL — ОГ 90-102 см, ОС 95-115 см
2XL — ОГ 92-106 см, ОС 96-118 см
3XL — ОГ 94-112 см, ОС 100-128 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-223-13/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-223-13/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-223-13/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-223-13/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-223-13/4.webp"}', true, true, 'talvyna', '[{"color": "рожевий", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}, {"size": "XL", "active": true}, {"size": "2XL", "active": true}, {"size": "3XL", "active": true}]}, {"color": "сірий", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}, {"size": "XL", "active": true}, {"size": "2XL", "active": true}, {"size": "3XL", "active": true}]}, {"color": "бордо", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}, {"size": "XL", "active": true}, {"size": "2XL", "active": true}, {"size": "3XL", "active": true}]}, {"color": "персиковий", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}, {"size": "XL", "active": true}, {"size": "2XL", "active": true}, {"size": "3XL", "active": true}]}]'::jsonb, 610),
  ('Халат із сорочкою «Орієнт»', '223/17', 'Халати', 1149, 1449, null, '{"S-M","L-XL","2XL-3XL"}', 'Квіткові гілочки на атласі задають комплекту східний настрій: халат і сорочка на тонких бретелях перегукуються відтінком і малюнком. Сорочка з м''якою драпіровкою на грудях спадає по фігурі, а халат вільного крою з поясом легко накинути зверху. Тканина переливається на світлі й приємно ковзає по шкірі, вільні рукави з невеликим об''ємом додають образу м''якості.

Комплектація: халат, сорочка, пояс
Матеріал: щільний м''який атлас
Колір: чорний, темно-бірюзовий, світло-бірюзовий, жовтий

Розмірна сітка:
S-M — ОГ 70-88 см, ОС 80-92 см
L-XL — ОГ 85-102 см, ОС 86-110 см
2XL-3XL — ОГ 80-116 см, ОС 102-124 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-223-17/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-223-17/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-223-17/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-223-17/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-223-17/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-223-17/5.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-223-17/6.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "темно-бірюзовий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "світло-бірюзовий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "жовтий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}]'::jsonb, 611),
  ('Халат із пеньюаром «Ніколь»', '223/20', 'Халати', 1049, 1349, null, '{"S","M","L"}', 'Пеньюар на тонких бретелях із мереживом по вирізу та фігурним низом із розрізом — деталь, яка робить силует легким і трохи грайливим. Разом із ним іде халат із поясом: накинути, коли хочеться прикритися, і зняти за секунду. Щільний м''який атлас красиво ловить світло й тримає форму, а мереживна облямівка повторює лінію декольте та подолу.

Комплектація: халат, пеньюар, пояс
Матеріал: щільний м''який атлас
Колір: чорний, рожевий, бордо

Розмірна сітка:
S — ОГ 70-82 см, ОС 80-87 см
M — ОГ 75-88 см, ОС 85-96 см
L — ОГ 85-96 см, ОС 90-112 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-223-20/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-223-20/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-223-20/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-223-20/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-223-20/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-223-20/5.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-223-20/6.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-223-20/7.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-223-20/8.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-223-20/9.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-223-20/10.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}]}, {"color": "рожевий", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}]}, {"color": "бордо", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}]}]'::jsonb, 612),
  ('Халат із пеньюаром і піжамою «Аліса»', '225/12', 'Халати', 1299, 1599, null, '{"S-M","L-XL","2XL-3XL"}', 'Мереживні вставки йдуть по борту халата, на рукавах і по низу шортів, тому речі виглядають як єдиний набір, навіть якщо носити їх окремо. Атлас делікатно блищить і гладко лягає по фігурі, а бретельки регулюються по висоті. Такий комплект добре працює і як подарунок, і як щоденна домашня білизна, у якій приємно провести вечір.

Комплектація: халат, пеньюар, пояс, піжамний комплект-двійка
Матеріал: щільний атлас, м''яке мереживо
Колір: зелений, рожевий, сірий, бордо

Розмірна сітка:
S-M — ОГ 70-88 см, ОС 80-92 см
L-XL — ОГ 85-102 см, ОС 86-110 см
2XL-3XL — ОГ 80-116 см, ОС 102-132 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-225-12/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-225-12/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-225-12/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-225-12/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-225-12/4.webp"}', true, true, 'talvyna', '[{"color": "зелений", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "рожевий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "сірий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "бордо", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}]'::jsonb, 613),
  ('Халат із піжамою «Кіото»', '225/14', 'Халати', 1649, 1949, null, '{"S-M","L-XL"}', 'Золотисті гілочки розсипані по атласу й переходять із довгого халата-кімоно на сорочку, тримаючи набір в одному настрої. Тканина гладенька та прохолодна на дотик, спадає рівними складками й не обтяжує силует. Бретельки регулюються по висоті, халат зав''язується поясом. Комплект зібраний так, що його зручно брати з собою в поїздку.

Комплектація: халат, пеньюар, пояс, піжамний комплект-двійка, сумочка
Матеріал: щільний м''який атлас
Колір: чорний, зелений, сірий

Розмірна сітка:
S-M — ОГ 70-94 см, ОС 80-104 см
L-XL — ОГ 90-108 см, ОС 95-124 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-225-14/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-225-14/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-225-14/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/hal-225-14/3.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}]}, {"color": "зелений", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}]}, {"color": "сірий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}]}]'::jsonb, 614);
