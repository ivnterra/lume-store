#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Перерахунок наявності купальників Talvyna за порогом (наявність + резерв) >= 5
(узгоджено з ботом @swimsuits_checking_goods_bot — див. stock-threshold-rule у пам'яті).

Набір кольорів і розмірів у картках не змінюється — оновлюються лише
прапорці active. Якщо в таблиці постачальника даних немає, значення
лишається як було, і рядок потрапляє у звіт. Неопубліковані товари
(published=false) не чіпаються — див. unpublished-no-resync у пам'яті.

Перед запуском покласти свіжу таблицю постачальника поруч зі скриптом:
    curl -sL -o sup.xlsx \\
      "https://drive.google.com/uc?export=download&id=1ecYHH4gLq8KvDsqlc-FVOtz3GcKTIjho"

    python3 recalc_swim.py           # тільки звіт
    python3 recalc_swim.py --apply   # записати в базу
"""
import json, os, re, sys, urllib.parse, urllib.request
import xlsx

THRESHOLD = 5
PROJ = '/Users/taniaka/Library/Mobile Documents/com~apple~CloudDocs/lume-store'
BASE = os.path.dirname(os.path.abspath(__file__))
SB = 'https://gwzywunqffubbmscmgam.supabase.co'
ANON = 'sb_publishable_agwV8VZz7vSQ_xQSONg22w_upAe5lQA'

COLOR = {                       # як у картці -> як у таблиці постачальника
    'чорний': 'черный', 'білий': 'белый', 'блакитний': 'голубой', 'червоний': 'красный',
    'зелений': 'зеленый', 'рожевий': 'розовый', 'бірюзовий': 'бирюзовый', 'жовтий': 'желтый',
    'сірий': 'серый', 'малиновий': 'малиновый', 'оранжевий': 'оранжевый',
    'помаранчевий': 'оранжевый', 'синій': 'синий', 'бордо': 'бордо', 'бордовий': 'бордо',
    'фіолетовий': 'фиолетовый', 'горошок': 'горох', 'коричневий': 'коричневый',
    'хакі': 'хаки', 'леопардовий': 'леопард', 'один колір': 'в одному кольорі',
}
SIZE = {'S': 'с', 'M': 'м', 'L': 'л', 'XL': 'хл', '2XL': '2хл',
        '3XL': '3хл', '4XL': '4хл', '5XL': '5хл', '6XL': '6хл'}


def load_table():
    rows = xlsx.read(os.path.join(BASE, 'sup.xlsx'), 'купальники')
    hdr = [h.strip().lower() for h in rows[0]]
    cols = {}                                   # назва кольору -> індекс колонки
    for i, h in enumerate(hdr):
        if h and h != 'резерв' and 'резерв' not in h and i >= 4:
            cols.setdefault(h, i)
    data = {}                                   # (код, розмір) -> {колір: кількість}
    num = lambda v: int(float(v)) if re.fullmatch(r'-?\d+(\.\d+)?', v or '') else 0
    for r in rows[1:]:
        if not r or not r[0].strip():
            continue
        code = r[0].strip()
        size = (r[1] if len(r) > 1 else '').strip().lower()
        cell = lambda i: (r[i].strip() if i < len(r) else '')
        entry = data.setdefault((code, size), {})
        for name, i in cols.items():
            v, res = cell(i), cell(i + 1)
            if v == '' and res == '':
                continue
            entry[name] = num(v) + num(res)
    return data


def main():
    table = load_table()
    # неопубліковані товари зняті свідомо (напр. висока частка повернень) —
    # їх наявність перераховувати не потрібно, навіть якщо є дані постачальника
    url = (SB + '/rest/v1/products?select=id,sku,title,variants&store=eq.talvyna'
           '&published=eq.true'
           '&category=eq.' + urllib.parse.quote('Купальники') + '&order=sort.asc')
    products = json.loads(urllib.request.urlopen(
        urllib.request.Request(url, headers={'apikey': ANON}), timeout=60).read())

    apply = '--apply' in sys.argv
    key = open(PROJ + '/.supabase-service-key').read().strip() if apply else None
    changed, missing = [], []

    for p in products:
        variants = p['variants'] or []
        diffs = []
        for v in variants:
            tab_color = COLOR.get(v['color'].lower())
            for s in v['sizes']:
                tab_size = SIZE.get(s['size'])
                qty = None
                if tab_color and tab_size:
                    qty = table.get((p['sku'], tab_size), {}).get(tab_color)
                if qty is None:
                    missing.append((p['sku'], v['color'], s['size']))
                    continue
                new = qty >= THRESHOLD
                if new != s['active']:
                    diffs.append((v['color'], s['size'], s['active'], new, qty))
                    s['active'] = new
            v['active'] = any(x['active'] for x in v['sizes'])
        if diffs:
            changed.append((p, diffs))

    print(f'Поріг: (наявність + резерв) >= {THRESHOLD}\n')
    for p, diffs in changed:
        print(f"{p['sku']:8} {p['title']}")
        for color, size, was, now, qty in diffs:
            mark = 'відкрито ' if now else 'закреслено'
            print(f'    {mark} {color} / {size}  ({qty} шт.)')
    print(f'\nтоварів зі змінами: {len(changed)} з {len(products)}')
    print(f'пар без даних у таблиці: {len(missing)}')
    if missing:
        seen = sorted({(a, b) for a, b, _ in missing})
        print('   ', seen[:12], '...' if len(seen) > 12 else '')

    if not apply:
        print('\n(звіт; щоб записати — запустіть із --apply)')
        return
    H = {'apikey': key, 'Authorization': 'Bearer ' + key,
         'Content-Type': 'application/json', 'Prefer': 'return=minimal'}
    for p, _ in changed:
        body = {'variants': p['variants'],
                'in_stock': any(v['active'] for v in p['variants'])}
        req = urllib.request.Request(f"{SB}/rest/v1/products?id=eq.{p['id']}", method='PATCH',
                                     headers=H, data=json.dumps(body, ensure_ascii=False).encode())
        urllib.request.urlopen(req, timeout=60)
    print(f'\nОновлено товарів: {len(changed)}')


if __name__ == '__main__':
    main()
