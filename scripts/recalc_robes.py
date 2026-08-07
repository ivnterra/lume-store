#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Перерахунок наявності халатів Talvyna за поточним THRESHOLD (stock.py, >= 5).

Перед запуском покласти свіжу таблицю постачальника поруч зі скриптом:
    curl -sL -o sup-1673532750.csv \\
      "https://docs.google.com/spreadsheets/d/1ecYHH4gLq8KvDsqlc-FVOtz3GcKTIjho/export?format=csv&gid=1673532750"

    python3 recalc_robes.py           # тільки звіт
    python3 recalc_robes.py --apply   # записати в базу
"""
import json, sys, urllib.parse, urllib.request
import stock

PROJ = '/Users/taniaka/Library/Mobile Documents/com~apple~CloudDocs/lume-store'
SB = 'https://gwzywunqffubbmscmgam.supabase.co'
ANON = 'sb_publishable_agwV8VZz7vSQ_xQSONg22w_upAe5lQA'


def main():
    url = (SB + '/rest/v1/products?select=id,sku,title,sizes,variants&store=eq.talvyna'
           '&published=eq.true&category=eq.' + urllib.parse.quote('Халати') + '&order=sort.asc')
    products = json.loads(urllib.request.urlopen(
        urllib.request.Request(url, headers={'apikey': ANON}), timeout=60).read())

    apply = '--apply' in sys.argv
    key = open(PROJ + '/.supabase-service-key').read().strip() if apply else None
    changed = []

    for p in products:
        new_variants = stock.variants_for(p['sku'], p['sizes'], stock.load())
        by_color = {v['color']: v for v in new_variants}
        diffs = []
        for v in p['variants']:
            nv = by_color.get(v['color'])
            if not nv:
                continue
            by_size = {s['size']: s['active'] for s in nv['sizes']}
            for s in v['sizes']:
                new = by_size.get(s['size'], s['active'])
                if new != s['active']:
                    diffs.append((v['color'], s['size'], s['active'], new))
                    s['active'] = new
            v['active'] = any(s['active'] for s in v['sizes'])
        if diffs:
            changed.append((p, diffs))

    print(f'Поріг: (наявність + резерв) >= {stock.THRESHOLD}\n')
    for p, diffs in changed:
        print(f"{p['sku']:8} {p['title']}")
        for color, size, was, now in diffs:
            print(f"    {'відкрито ' if now else 'закреслено'} {color} / {size}")
    print(f'\nтоварів зі змінами: {len(changed)} з {len(products)}')

    if not apply:
        print('\n(звіт; щоб записати — запустіть із --apply)')
        return
    H = {'apikey': key, 'Authorization': 'Bearer ' + key,
         'Content-Type': 'application/json', 'Prefer': 'return=minimal'}
    for p, _ in changed:
        body = {'variants': p['variants'], 'in_stock': any(v['active'] for v in p['variants'])}
        req = urllib.request.Request(f"{SB}/rest/v1/products?id=eq.{p['id']}", method='PATCH',
                                     headers=H, data=json.dumps(body, ensure_ascii=False).encode())
        urllib.request.urlopen(req, timeout=60)
    print(f'\nОновлено товарів: {len(changed)}')


if __name__ == '__main__':
    main()
