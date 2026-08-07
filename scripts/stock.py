#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Наявність халатів із таблиці постачальника -> variants (колір x розмір)."""
import csv, os

BASE = os.path.dirname(os.path.abspath(__file__))
CSV = os.path.join(BASE, 'sup-1673532750.csv')
THRESHOLD = 5           # доступно, якщо (наявність + резерв) >= 5

# назви кольорів постачальника -> як на сайті
COLOR = {
    'Черный': 'чорний', 'Белый': 'білий', 'Голубой': 'голубий', 'Красный': 'червоний',
    'Зеленый': 'зелений', 'темно-зелений': 'темно-зелений', 'темно-бірюзовий': 'темно-бірюзовий',
    'Розовый': 'рожевий', 'Світло - бірюзовий': 'світло-бірюзовий', 'Бірюзовий': 'бірюзовий',
    'Желтый': 'жовтий', 'Серый': 'сірий', 'Малиновый': 'малиновий', 'Оранжевый': 'жовтогарячий',
    'Синий': 'синій', 'Темно-синий': 'темно-синій', 'светло-зеленый': 'світло-зелений',
    'Бордовый': 'бордо', 'Фиолетовый': 'фіолетовий', 'Гороховый': 'у горох',
    'Коричневый': 'коричневий', 'Зелено-серый': 'зелено-сірий', 'Персиковый': 'персиковий',
    'Леопардовый': 'леопардовий', 'Бежевый': 'бежевий', 'один колір': 'один колір',
}

# розмірна група в таблиці -> розміри картки
GROUP = {
    'с-м': ['S-M'], 'л-хл': ['L-XL'], '2-3хл': ['2XL-3XL'], '2-3хл ': ['2XL-3XL'],
    'с-л': ['S', 'M', 'L'], 'хл-3хл': ['XL', '2XL', '3XL'],
    'с': ['S'], 'м': ['M'], 'л': ['L'], 'хл': ['XL'],
}


def load():
    rows = list(csv.reader(open(CSV, encoding='utf-8')))
    hdr = rows[0]
    cols = [(i, COLOR[h.strip()]) for i, h in enumerate(hdr)
            if h.strip() in COLOR and '(резерв)' not in h]
    data = {}
    for r in rows[1:]:
        if not r or not r[0].strip():
            continue
        code = r[0].strip()
        group = r[1].strip().lower() if len(r) > 1 else ''
        entry = data.setdefault(code, {})
        for i, name in cols:
            cell = r[i].strip() if i < len(r) else ''
            res = r[i+1].strip() if i+1 < len(r) else ''
            if cell == '' and res == '':
                continue            # колір не належить цій моделі
            num = lambda v: int(v) if v.lstrip('-').isdigit() else 0
            entry.setdefault(name, {})[group] = num(cell) + num(res)
    return data


def variants_for(code, sizes, data):
    """[{color, active, sizes:[{size, active}]}] + перелік кольорів."""
    entry = data.get(code)
    if not entry:
        raise SystemExit(f'{code}: немає в таблиці постачальника')
    out = []
    for color, groups in entry.items():
        by_size = {}
        for group, qty in groups.items():
            targets = GROUP.get(group, sizes) if group else sizes
            for s in targets:
                if s in sizes:
                    by_size[s] = max(by_size.get(s, 0), qty)
        rows = [{'size': s, 'active': by_size.get(s, 0) >= THRESHOLD} for s in sizes]
        missing = [s for s in sizes if s not in by_size]
        if missing:
            print(f'  УВАГА {code}/{color}: немає даних для розмірів {missing}')
        out.append({'color': color, 'active': any(r['active'] for r in rows), 'sizes': rows})
    return out


if __name__ == '__main__':
    from cards import CARDS
    data = load()
    print(f'Поріг наявності: (наявність + резерв) >= {THRESHOLD}\n')
    for c in CARDS:
        v = variants_for(c['sku'], c['sizes'], data)
        on = [x['color'] for x in v if x['active']]
        off = [x['color'] for x in v if not x['active']]
        part = []
        for x in v:
            if x['active'] and not all(s['active'] for s in x['sizes']):
                part.append(x['color'] + ' (' + ', '.join(s['size'] for s in x['sizes'] if not s['active']) + ')')
        print(f"{c['sku']:9} {c['title'][:44]:46}")
        print(f"           у наявності: {', '.join(on) or '—'}")
        if off:
            print(f"           закінчилися: {', '.join(off)}")
        if part:
            print(f"           частково:    {'; '.join(part)}")
