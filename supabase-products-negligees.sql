-- ============================================================
--  TALVYNA — каталог: пеньюари
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
  ('Пеньюар-сіточка «Ванесса»', '39/54', 'Пеньюари', 799, 1099, null, '{"S-M","L-XL","2XL-3XL"}', 'Прозора сіточка ледь торкається шкіри, а контрастна квіткова вишивка по бретелях і чашечках додає образу дівочої ніжності. Ліф підтримує груди, атласна стрічка під ним зав''язується бантом — глибину декольте регулюєте самі. Спідниця вільно розлітається від грудей і красиво тримає рух. Такий пеньюар створений радше для настрою, ніж для сну: у ньому легко почуватися впевнено.

Комплектація: пеньюар, трусики
Матеріал: сітка, вишивка
Колір: чорний, бордо

Розмірна сітка:
S-M — ОГ 70-88 см, ОС 80-102 см
L-XL — ОГ 80-102 см, ОС 90-118 см
2XL-3XL — ОГ 87-116 см, ОС 95-134 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-54/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-54/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-54/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-54/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-54/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-54/5.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-54/6.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-54/7.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "бордо", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}]'::jsonb, 801),
  ('Мереживний пеньюар «Ізольда»', '39/53', 'Пеньюари', 849, 1149, null, '{"S","M","L"}', 'Насичений винний відтінок і мереживний ліф із дрібним квітковим візерунком роблять цей пеньюар святковим. Від грудей спадає легка спідниця з розрізом спереду, її край оздоблено дрібними воланами — силует виходить пишним і грайливим. Тонкі бретелі регулюються, невеликий бант посередині ліфа завершує образ. Спина відкрита, тож модель гарно виглядає з будь-якого ракурсу.

Комплектація: пеньюар, трусики-стрінги
Колір: бордо

Розмірна сітка:
S — ОГ 70-92 см, ОС 76-102 см
M — ОГ 80-102 см, ОС 82-110 см
L — ОГ 87-110 см, ОС 88-126 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-53/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-53/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-53/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-53/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-53/4.webp"}', true, true, 'talvyna', '[{"color": "бордо", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}]}]'::jsonb, 802),
  ('Пеньюар із мереживом «Наомі»', '39/46', 'Пеньюари', 749, 1049, null, '{"S-M","L-XL","2XL-3XL"}', 'М''яка щільна тканина зі стрейчем лягає по фігурі й окреслює силует, не стискаючи рухів. Мереживо йде по глибокому вирізу та по низу, а високий боковий розріз відкриває ногу під час кроку. Маленький бант під грудьми додає моделі ніжності. Пеньюар однаково добре працює і для фотосесії, і для сну.

Комплектація: пеньюар, стрінги
Матеріал: котон, стрейч
Колір: чорний, рожевий, бордо, сірий

Розмірна сітка:
S-M — ОГ 70-90 см, ОС 80-102 см
L-XL — ОГ 80-106 см, ОС 90-120 см
2XL-3XL — ОГ 90-116 см, ОС 100-132 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-46/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-46/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-46/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-46/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-46/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-46/5.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-46/6.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-46/7.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "рожевий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "бордо", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "сірий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}]'::jsonb, 803),
  ('Леопардовий пеньюар «Мадлен»', '39/45', 'Пеньюари', 749, 1049, null, '{"S-M","L-XL","2XL-3XL","4XL-5XL"}', 'Леопардовий принт і чорне мереживо по низу — поєднання, яке не залишає сумнівів у настрої. Чашечки тримають форму грудей, тканина зі стрейчем щільно обіймає фігуру й підкреслює талію. Боковий розріз із мереживною вставкою відкриває стегно, а тонкі бретелі регулюються по висоті. Розмірний ряд іде до 5XL, тож модель добре сідає й на пишні форми.

Комплектація: пеньюар із чашечками
Матеріал: котон, стрейч
Колір: леопардовий

Розмірна сітка:
S-M — ОГ 70-90 см, ОС 80-102 см
L-XL — ОГ 80-106 см, ОС 90-120 см
2XL-3XL — ОГ 90-116 см, ОС 100-132 см
4XL-5XL — ОГ 100-126 см, ОС 110-145 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-45/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-45/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-45/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-45/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-45/4.webp"}', true, true, 'talvyna', '[{"color": "леопардовий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}, {"size": "4XL-5XL", "active": true}]}]'::jsonb, 804),
  ('Атласний пеньюар «Пристрасть»', '39/36', 'Пеньюари', 749, 1049, null, '{"S-M","L-XL","2XL-3XL","4XL-5XL"}', 'Сердечка з написами або леопардовий принт — залежно від кольору модель звучить по-різному, але щоразу помітно. Виріз облямований мереживом, на бретелях зав''язані маленькі банти, а по низу є розріз, який відкриває ногу. Тканина зі стрейчем щільно сідає по фігурі й гарно тягнеться, тому пеньюар зручний навіть у великих розмірах — ряд іде до 5XL.

Комплектація: пеньюар, стринги
Матеріал: стрейч
Колір: чорний, білий, леопардовий

Розмірна сітка:
S-M — ОГ 85-110 см, ОС 90-120 см
L-XL — ОГ 90-126 см, ОС 100-132 см
2XL-3XL — ОГ 95-136 см, ОС 110-142 см
4XL-5XL — ОГ 100-146 см, ОС 120-162 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-36/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-36/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-36/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-36/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-36/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-36/5.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}, {"size": "4XL-5XL", "active": true}]}, {"color": "білий", "active": false, "sizes": [{"size": "S-M", "active": false}, {"size": "L-XL", "active": false}, {"size": "2XL-3XL", "active": false}, {"size": "4XL-5XL", "active": false}]}, {"color": "леопардовий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}, {"size": "4XL-5XL", "active": true}]}]'::jsonb, 805),
  ('Мереживний пеньюар «Сирена»', '39/33', 'Пеньюари', 799, 1099, null, '{"S-M","L-XL","2XL-3XL","4XL-5XL"}', 'Мереживний ліф із фігурними чашечками переходить у прозору спідницю, яка вільно розлітається від грудей і завершується дрібним воланом. Атласний бант посередині стягує ліф і додає моделі кокетства. Мереживо м''яке, зі спандексом — воно добре тягнеться й повторює рухи. Спина відкрита, бретелі регулюються. Розмірний ряд до 5XL.

Комплектація: пеньюар, мереживні трусики
Матеріал: бавовна, спандекс, мереживо
Колір: чорний, рожевий, зелений, бордо, синій

Розмірна сітка:
S-M — ОГ 70-88 см, ОС 80-102 см
L-XL — ОГ 80-102 см, ОС 90-118 см
2XL-3XL — ОГ 87-116 см, ОС 95-134 см
4XL-5XL — ОГ 100-120 см, ОС 105-145 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-33/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-33/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-33/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-33/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-33/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-33/5.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-33/6.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-33/7.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-33/8.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-33/9.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-33/10.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}, {"size": "4XL-5XL", "active": true}]}, {"color": "рожевий", "active": false, "sizes": [{"size": "S-M", "active": false}, {"size": "L-XL", "active": false}, {"size": "2XL-3XL", "active": false}, {"size": "4XL-5XL", "active": false}]}, {"color": "зелений", "active": false, "sizes": [{"size": "S-M", "active": false}, {"size": "L-XL", "active": false}, {"size": "2XL-3XL", "active": false}, {"size": "4XL-5XL", "active": false}]}, {"color": "бордо", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}, {"size": "4XL-5XL", "active": true}]}, {"color": "синій", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}, {"size": "4XL-5XL", "active": true}]}]'::jsonb, 806),
  ('Мереживний пеньюар «Селін»', '39/30', 'Пеньюари', 749, 1049, null, '{"S-M","L-XL","2XL-3XL"}', 'Суцільне мереживо з великим візерунком і напівпрозорі вставки роблять модель відвертою, але не вульгарною. Ліф підтримує груди, подвійні бретелі перетинаються на плечах, а низ вільно спадає й відкривається спереду. Мереживо дуже приємне до тіла — не дряпає й не тисне навіть після кількох годин. За бажанням у зоні паху можна вшити кнопки — скажіть про це менеджеру при замовленні.

Комплектація: пеньюар
Матеріал: нейлон, мереживо
Колір: чорний, червоний, рожевий

Розмірна сітка:
S-M — ОГ 75-94 см, ОС 85-98 см
L-XL — ОГ 85-108 см, ОС 90-128 см
2XL-3XL — ОГ 95-122 см, ОС 95-138 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-30/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-30/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-30/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-30/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-30/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-30/5.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "червоний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "рожевий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}]'::jsonb, 807),
  ('Мереживний пеньюар «Кармелла»', '39/26', 'Пеньюари', 799, 1099, null, '{"S-M","L-XL","2XL-3XL","4XL-5XL","6XL-7XL"}', 'Контрастне світле мереживо по вирізу й широкою смугою по низу — саме воно робить цю модель помітною. Ліф із м''якими чашечками зібраний бантом, спідниця легка, вільна, трохи розкльошена. Тонке нейлонове полотно майже не відчувається на тілі. Розмірний ряд від S-M до 6XL-7XL, тож підібрати посадку зможе кожна.

Комплектація: пеньюар, труси
Матеріал: нейлон, мереживо
Колір: чорний, червоний, помаранчевий

Розмірна сітка:
S-M — ОГ 70-88 см, ОС 80-98 см
L-XL — ОГ 80-96 см, ОС 90-112 см
2XL-3XL — ОГ 87-112 см, ОС 95-126 см
4XL-5XL — ОГ 95-118 см, ОС 100-130 см
6XL-7XL — ОГ 100-124 см, ОС 105-134 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-26/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-26/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-26/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-26/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-26/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-26/5.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-26/6.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}, {"size": "4XL-5XL", "active": true}, {"size": "6XL-7XL", "active": true}]}, {"color": "червоний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}, {"size": "4XL-5XL", "active": true}, {"size": "6XL-7XL", "active": true}]}, {"color": "помаранчевий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}, {"size": "4XL-5XL", "active": true}, {"size": "6XL-7XL", "active": false}]}]'::jsonb, 808),
  ('Мереживний пеньюар «Жизель»', '39/25', 'Пеньюари', 799, 1099, null, '{"S-M","L-XL","2XL-3XL","4XL-5XL","6XL-7XL"}', 'Мереживний ліф із квітковим візерунком переходить у м''яку спідницю, що вільно спадає від грудей і не підкреслює живіт. Виріз глибокий, спина відкрита, на бретелях квіткові акценти з того ж мережива. Спандекс у складі дає гарну еластичність: модель тягнеться й повторює фігуру, а не диктує їй форму. Розміри — від S-M до 6XL-7XL.

Комплектація: пеньюар, трусики
Матеріал: спандекс, мереживо, нейлон
Колір: чорний, червоний, рожевий

Розмірна сітка:
S-M — ОГ 70-82 см, ОС 80-94 см
L-XL — ОГ 80-96 см, ОС 90-110 см
2XL-3XL — ОГ 88-104 см, ОС 102-118 см
4XL-5XL — ОГ 92-116 см, ОС 110-128 см
6XL-7XL — ОГ 94-128 см, ОС 110-144 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-25/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-25/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-25/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-25/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-25/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-25/5.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-25/6.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-25/7.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}, {"size": "4XL-5XL", "active": true}, {"size": "6XL-7XL", "active": true}]}, {"color": "червоний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}, {"size": "4XL-5XL", "active": true}, {"size": "6XL-7XL", "active": true}]}, {"color": "рожевий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}, {"size": "4XL-5XL", "active": true}, {"size": "6XL-7XL", "active": true}]}]'::jsonb, 809),
  ('Мереживний пеньюар «Далія»', '39/23', 'Пеньюари', 799, 1099, null, '{"S-M","L-XL","2XL-3XL"}', 'Мереживна вставка на талії розділяє силует і візуально витягує його, а спідниця від неї спадає м''якими складками. Ліф із фігурними чашечками підтримує груди, тонкі бретелі регулюються по висоті. Тканина гладенька, лягає по тілу м''якими складками. Модель виглядає радше як коротка сукня — у ній не соромно вийти на кухню по каву.

Комплектація: пеньюар, стринги
Матеріал: поліестер, мереживо
Колір: чорний, бордо

Розмірна сітка:
S-M — ОГ 70-96 см, ОС 80-98 см
L-XL — ОГ 80-110 см, ОС 92-132 см
2XL-3XL — ОГ 90-124 см, ОС 102-142 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-23/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-23/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-23/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-23/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-23/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-23/5.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-23/6.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-23/7.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "бордо", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}]'::jsonb, 810),
  ('Атласний пеньюар «Естель»', '39/18', 'Пеньюари', 749, 1049, null, '{"S","M","L"}', 'Щільний атлас гарно ловить світло й спадає рівними складками, а мереживний ліф додає моделі м''якості. Спідниця розкльошена від грудей, тому силует виходить легким і не облягає живіт. Виріз глибокий, зав''язаний тонким бантом, спина відкрита. Модель однаково доречна і для сну, і для світлин.

Комплектація: пеньюар, стринги
Матеріал: щільний атлас
Колір: чорний, рожевий, зелений

Розмірна сітка:
S — ОГ 75-84 см, ОС 85-100 см
M — ОГ 80-90 см, ОС 90-106 см
L — ОГ 85-94 см, ОС 92-110 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-18/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-18/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-18/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-18/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-18/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-18/5.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-18/6.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-18/7.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}]}, {"color": "рожевий", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}]}, {"color": "зелений", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}]}]'::jsonb, 811),
  ('Мереживний пеньюар «Мішель»', '39/21', 'Пеньюари', 749, 1049, null, '{"S","M","L","XL","2XL"}', 'Два великі атласні банти на грудях — деталь, заради якої й купують цю модель: вони зав''язуються спереду, тож глибину декольте ви регулюєте самі. Далі йде прозора спідниця, що вільно розлітається від грудей і відкривається посередині. Мереживо дуже приємне до тіла. Пеньюар особливо ефектний на світлинах.

Комплектація: пеньюар, труси
Матеріал: бавовна, мереживо
Колір: чорний, рожевий, бордо

Розмірна сітка:
S — ОГ 70-80 см, ОС 80-88 см
M — ОГ 75-85 см, ОС 85-92 см
L — ОГ 80-92 см, ОС 90-98 см
XL — ОГ 85-98 см, ОС 95-106 см
2XL — ОГ 90-108 см, ОС 100-118 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-21/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-21/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-21/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-21/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-21/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-21/5.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-21/6.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-21/7.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-21/8.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-21/9.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-21/10.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}, {"size": "XL", "active": true}, {"size": "2XL", "active": true}]}, {"color": "рожевий", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}, {"size": "XL", "active": true}, {"size": "2XL", "active": true}]}, {"color": "бордо", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}, {"size": "XL", "active": true}, {"size": "2XL", "active": true}]}]'::jsonb, 812),
  ('Мереживний пеньюар «Північ»', '39/31', 'Пеньюари', 699, 999, null, '{"S-M","L-XL","2XL-3XL"}', 'Чорне мереживо на ліфі й хвиляста мереживна смуга по низу — лаконічна модель, у якій усе побудовано на фактурі. Напівпрозора сітка між ними окреслює талію, а спідниця трохи розкльошена, тож силует виходить м''яким. Тканина зі спандексом добре тягнеться й лягає по фігурі без стягування. Класика, яка завжди доречна.

Комплектація: пеньюар, стринги
Матеріал: бавовна, спандекс, мереживо
Колір: чорний

Розмірна сітка:
S-M — ОГ 70-88 см, ОС 80-98 см
L-XL — ОГ 80-96 см, ОС 90-112 см
2XL-3XL — ОГ 87-112 см, ОС 95-126 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-31/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-31/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-31/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-31/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-31/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-31/5.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-39-31/6.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S-M", "active": false}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}]'::jsonb, 813),
  ('Мереживний пеньюар «Анжеліка»', '16/28', 'Пеньюари', 749, 1049, null, '{"S","M","L","XL","2XL","3XL","4XL","5XL","6XL"}', 'Атласний пояс зав''язується бантом під грудьми й акуратно позначає найтоншу частину силуету, а нижче спадає прозора спідниця з широкою мереживною облямівкою. Бретелі регулюються по висоті. Мереживо м''яке, з бавовною в складі, тому пеньюар приємний до тіла й не дряпає. Дев''ять розмірів — від S до 6XL. За бажанням можна замовити послугу вшивання кісточок.

Комплектація: пеньюар, мереживні стрінги
Матеріал: бавовна, спандекс, мереживо
Колір: чорний, білий

Розмірна сітка:
S — ОГ 70-85 см, ОС 80-85 см
M — ОГ 75-90 см, ОС 85-90 см
L — ОГ 80-95 см, ОС 90-105 см
XL — ОГ 85-100 см, ОС 95-110 см
2XL — ОГ 90-105 см, ОС 100-115 см
3XL — ОГ 95-110 см, ОС 105-120 см
4XL — ОГ 100-115 см, ОС 110-125 см
5XL — ОГ 105-120 см, ОС 115-130 см
6XL — ОГ 110-125 см, ОС 115-145 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-28/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-28/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-28/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-28/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-28/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-28/5.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-28/6.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-28/7.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-28/8.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-28/9.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}, {"size": "XL", "active": true}, {"size": "2XL", "active": true}, {"size": "3XL", "active": true}, {"size": "4XL", "active": true}, {"size": "5XL", "active": true}, {"size": "6XL", "active": true}]}, {"color": "білий", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}, {"size": "XL", "active": true}, {"size": "2XL", "active": true}, {"size": "3XL", "active": true}, {"size": "4XL", "active": true}, {"size": "5XL", "active": true}, {"size": "6XL", "active": true}]}]'::jsonb, 814),
  ('Мереживний пеньюар «Люсія»', '16/42', 'Пеньюари', 699, 999, null, '{"S-M","L-XL","2XL-3XL","4XL-5XL"}', 'Мереживний ліф із глибоким V-подібним вирізом переходить у легку спідницю, яка загортається спереду й відкриває ногу під час руху. Шість кольорів — від класичного чорного до жовтого й фіолетового, тож модель легко підібрати під настрій. Мереживо м''яке та еластичне. Розмірний ряд до 5XL.

Комплектація: пеньюар, мереживні стрінги
Матеріал: бавовна, спандекс, мереживо
Колір: чорний, білий, рожевий, фіолетовий, жовтий, бордо

Розмірна сітка:
S-M — ОГ 70-87 см, ОС 80-95 см
L-XL — ОГ 80-100 см, ОС 90-120 см
2XL-3XL — ОГ 90-116 см, ОС 100-136 см
4XL-5XL — ОГ 94-120 см, ОС 106-146 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-42/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-42/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-42/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-42/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-42/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-42/5.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-42/6.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-42/7.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-42/8.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-42/9.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}, {"size": "4XL-5XL", "active": true}]}, {"color": "білий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}, {"size": "4XL-5XL", "active": true}]}, {"color": "рожевий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}, {"size": "4XL-5XL", "active": true}]}, {"color": "фіолетовий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}, {"size": "4XL-5XL", "active": true}]}, {"color": "жовтий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}, {"size": "4XL-5XL", "active": true}]}, {"color": "бордо", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}, {"size": "4XL-5XL", "active": true}]}]'::jsonb, 815),
  ('Пеньюар із мереживом «Аліна»', '16/45', 'Пеньюари', 799, 1099, null, '{"S","M","L","XL","2XL","3XL","4XL"}', 'Подвійні бретелі з маленькими бантами й мереживний ліф із щільним візерунком створюють акцент угорі, а прозора спідниця з розрізом спереду відкриває ногу. Завдяки спандексу модель добре тягнеться й сідає по фігурі, не перетягуючи. Шість кольорів і сім розмірів — від S до 4XL. За бажанням можна замовити послугу вшивання кісточок.

Комплектація: пеньюар
Матеріал: спандекс, мереживо, нейлон
Колір: чорний, червоний, білий, рожевий, бордо, синій

Розмірна сітка:
S — ОГ 70-80 см, ОС 80-85 см
M — ОГ 75-85 см, ОС 85-90 см
L — ОГ 80-90 см, ОС 90-95 см
XL — ОГ 85-95 см, ОС 95-100 см
2XL — ОГ 90-105 см, ОС 100-115 см
3XL — ОГ 92-108 см, ОС 102-122 см
4XL — ОГ 94-114 см, ОС 106-134 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-45/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-45/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-45/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-45/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-45/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-45/5.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-45/6.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-45/7.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-45/8.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-45/9.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}, {"size": "XL", "active": true}, {"size": "2XL", "active": true}, {"size": "3XL", "active": true}, {"size": "4XL", "active": true}]}, {"color": "червоний", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}, {"size": "XL", "active": true}, {"size": "2XL", "active": true}, {"size": "3XL", "active": true}, {"size": "4XL", "active": true}]}, {"color": "білий", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}, {"size": "XL", "active": true}, {"size": "2XL", "active": true}, {"size": "3XL", "active": true}, {"size": "4XL", "active": true}]}, {"color": "рожевий", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}, {"size": "XL", "active": true}, {"size": "2XL", "active": true}, {"size": "3XL", "active": true}, {"size": "4XL", "active": true}]}, {"color": "бордо", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}, {"size": "XL", "active": true}, {"size": "2XL", "active": true}, {"size": "3XL", "active": true}, {"size": "4XL", "active": true}]}, {"color": "синій", "active": true, "sizes": [{"size": "S", "active": true}, {"size": "M", "active": true}, {"size": "L", "active": true}, {"size": "XL", "active": true}, {"size": "2XL", "active": true}, {"size": "3XL", "active": true}, {"size": "4XL", "active": true}]}]'::jsonb, 816),
  ('Пеньюар із зав''язками «Сабріна»', '16/46', 'Пеньюари', 749, 1049, null, '{"S-M","L-XL","2XL-3XL"}', 'Широка стрічка зав''язується під грудьми великим бантом — його можна лишити спереду або зав''язати ззаду, і силует щоразу читається по-новому. Напівпрозора спідниця спадає м''якими складками й закінчується дрібним воланом. Тканина зі спандексом гарно тягнеться, тому модель сідає по фігурі без зайвого тиску. Виглядає дорого навіть на фото.

Комплектація: пеньюар, стрінги
Матеріал: спандекс, мереживо, нейлон
Колір: чорний, білий, бордо

Розмірна сітка:
S-M — ОГ 70-86 см, ОС 80-94 см
L-XL — ОГ 80-99 см, ОС 90-108 см
2XL-3XL — ОГ 90-112 см, ОС 100-128 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-46/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-46/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-46/2.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-46/3.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-46/4.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-46/5.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-46/6.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-46/7.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-46/8.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-46/9.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "білий", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}, {"color": "бордо", "active": true, "sizes": [{"size": "S-M", "active": true}, {"size": "L-XL", "active": true}, {"size": "2XL-3XL", "active": true}]}]'::jsonb, 817),
  ('Мереживний пеньюар «Емма»', '16/66', 'Пеньюари', 799, 1099, null, '{"Універсальний"}', 'Мереживний ліф зібраний бантом посередині, від нього спадає прозора спідниця з воланом по низу — модель виглядає легкою й повітряною. Резинка під грудьми добре тягнеться, тому один розмір підходить від S до 3XL: пеньюар сідає по фігурі й не перетискає. Мереживо з бавовною приємне до тіла, спина лишається відкритою.

Комплектація: пеньюар, стринги
Матеріал: бавовна, спандекс, мереживо
Колір: чорний, бордо

Розмірна сітка:
Універсальний — S–3XL, під грудьми тягнеться від 60 до 130 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-66/1.webp', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-66/1.webp","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/pen-16-66/2.webp"}', true, true, 'talvyna', '[{"color": "чорний", "active": true, "sizes": [{"size": "Універсальний", "active": true}]}, {"color": "бордо", "active": true, "sizes": [{"size": "Універсальний", "active": true}]}]'::jsonb, 818);
