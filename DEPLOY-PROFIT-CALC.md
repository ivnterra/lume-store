# Деплой калькулятора прибыли на Vercel (инструкция для Claude Code)

## Что это
В папке `profit-calc/` лежит автономный `index.html` — калькулятор юнит-экономики Talvyna
(на украинском, CPL с долларовым эквивалентом). Его нужно развернуть как **отдельный**
Vercel-проект, чтобы получить публичную ссылку для куратора.
ВАЖНО: это не часть основного сайта — НЕ добавлять в деплой основного проекта talvyna.com.

## Задача для Claude Code
Разверни `profit-calc/` как новый статический проект Vercel с именем `talvyna-profit-calc`,
target=production. Ожидаемый результат: страница доступна по адресу вида
`https://talvyna-profit-calc.vercel.app`.

## Шаги
1. Проверить, установлен ли Vercel CLI: `vercel --version`.
   Если нет: `npm i -g vercel`.
2. Проверить логин: `vercel whoami`. Если не залогинен: `vercel login`
   (пользователь подтвердит вход через браузер/email).
3. Из папки `profit-calc/`:
   ```bash
   cd profit-calc
   vercel link
   ```
   - Set up? → yes
   - Scope → team пользователя (terra's projects)
   - Link to existing project? → no
   - Project name → `talvyna-profit-calc`
   - Directory → `./` (текущая, т.е. profit-calc)
   - Build settings → всё по умолчанию (статический сайт, без build command)

   Затем:
   ```bash
   vercel deploy --prod
   ```
4. Вывести пользователю итоговый production URL.
5. Проверка: открыть URL — страница должна показать заголовок
   «Talvyna — калькулятор місячного прибутку», рабочие ползунки и цифры.

## Примечания
- Проект статический: один index.html, без сборки и зависимостей.
- В head стоит meta robots noindex — страница не должна индексироваться.
- Дефолтные цифры (CPL, выкуп и т.д.) — в массиве P внутри script в index.html (поле val).
- Курс грн/$ по умолчанию 44.85 — меняется прямо на странице, код трогать не нужно.
