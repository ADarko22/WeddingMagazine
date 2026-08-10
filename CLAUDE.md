# Wedding Magazine — authoring & customization guide

Deep guide for editing the magazine **and for forking it into your own version**. For the
project overview and the live link see [`README.md`](README.md); for reuse terms and image
credits see [`LICENSE`](LICENSE) and [`NOTICE.md`](NOTICE.md).

Typeset with [Typst](https://typst.app), built once per language. Core principle:
**all wording lives in `lang/<code>.yaml`; all layout lives in `components/styles.typ`** — to
change text you almost never touch `.typ` files.

## Contents
- [Architecture at a glance](#architecture-at-a-glance)
- [Build](#build)
- [Editing content](#editing-content)
- [Language plumbing and helpers](#language-plumbing-and-helpers)
- [Content, section and assets map](#content-section-and-assets-map)
- [Make it your own](#make-it-your-own)
- [Layout toolkit](#layout-toolkit)

## Architecture at a glance

Five files/roles, and how content flows into a PDF:

```
typst compile --input lang=ro …
   └─ lang.typ  ──loads──▶ lang/ro.yaml ──▶ `strings` (a dictionary of all the words)
                                              │
   sections/*.typ  ──read `strings`, call──▶ components/styles.typ (layout helpers)
   main.typ  ──sets up the page, orders the sections (+ quote interludes)──▶ out/wedding-ro.pdf
```

| File / folder | Role |
|---|---|
| `main.typ` | Document setup (page, fonts, headings) + the **running order** — the `#include` list *is* the table of contents. |
| `sections/*.typ` | One file per chapter. Reads its slice of `strings` and calls layout helpers. |
| `components/styles.typ` | The **design system**: palette, fonts, design tokens, and every layout helper. |
| `lang.typ` | Language selection + the text helpers (`markup`, `markup-narrow`, `lead-paragraph`). |
| `lang/<code>.yaml` | **All the words**, one file per language — every language file has identical keys. |

## Build

```bash
./build.sh          # builds every language into out/wedding-<code>.pdf
./build.sh en       # a single language
./build.sh en ro    # a subset
```

Needs the Typst CLI: `brew install typst` (the VS Code Tinymist extension has no CLI binary).
Fonts **Didot** + **Avenir Next** ship with macOS. If Typst is off your PATH:
`TYPST=/path/to/typst ./build.sh`.

## Editing content

Content lives in `lang/<code>.yaml`. `en.yaml` is the **source of truth**; `it.yaml` and `ro.yaml` mirror its keys exactly. When you
add or rename a key, change it in **every** language file so all editions stay in sync (the build
errors on a missing key).

Values may contain **Typst markup** — translate the words, keep the markup:

| Markup | Renders as |
|--------|-----------|
| `_text_` | _italic_ |
| `*text*` | *bold* |
| `#link("https://…")[label]` | a hyperlink |
| trailing `\` at end of line | a line break |
| a blank line | a new paragraph |
| `\#`, `\«` | a literal `#` / `«` (escape Typst-special chars) |

Lists like `wedding_day.timeline` and `before_you_come.checklist` are consumed by matching
components (`timeline(...)`, `checklist(...)`).

## Language plumbing and helpers

Defined in `lang.typ` — these turn YAML strings into rendered text:

| Helper | Use it for | Example |
|--------|-----------|---------|
| `strings` | the parsed YAML dictionary (all content) | `strings.meta.couple` |
| `lang` | the current language code | rarely needed directly |
| `markup(value)` | **any** value with inline markup | `#markup(strings.napoli.intro)` |
| `markup-narrow(value)` | body text in a **narrow column** (ragged-right, looser leading) | `#markup-narrow(copy.transit_body)` |
| `lead-paragraph(value)` | a section's **opening paragraph** (drop-capped first letter) | `#lead-paragraph(copy.intro)` |

Quote interludes (the full-page ivory quotes between chapters) are defined in `main.typ`:

| Helper | Use it for |
|--------|-----------|
| `quote-interlude(i)` | a full-page quote from `strings.quotes` **by position** (0-based: `quote-interlude(2)` = the 3rd entry) |
| `quote-interlude-text(txt)` | a full-page quote from an explicit markup string (e.g. the `*.explore` lines) |
| `nth-quote(i)` | the raw quote dict (used internally by `quote-interlude`) |

## Content, section and assets map

Each section aliases one top-level YAML key with `#let copy = strings.<key>`, then reads
`copy.<field>`. **The section file name, the YAML key, and the assets folder are three
independent names you control** (e.g. `getting_around` ↔ `info` ↔ `04-info`):

| Section file | YAML key (`copy = strings.…`) | Assets |
|---|---|---|
| `01_cover.typ` | `cover` | `assets/01-cover/`, `ATB-logo*.png` |
| `02_welcome.typ` | `welcome` | `assets/02-welcome/` |
| `03_1_caserta_sights.typ` | `caserta` | `assets/03-1-caserta/` |
| `03_2_napoli_sights.typ` | `napoli` | `assets/03-2-napoli/` |
| `03_3_amalfi_coast-sights.typ` | `amalfi` | `assets/03-3-amalfi-coast/` |
| `04_1_getting_around.typ` | `info` | `assets/04-info/` |
| `04_2_wedding_day.typ` | `wedding_day` | (placeholders) |
| `04_3_before_you_come.typ` | `before_you_come` | (placeholders) |
| `05_cover_back.typ` | `meta`, `labels` | `ATB-logo*.png` |

**Cross-cutting keys** read by many sections: `meta` (couple, date), `ui` (section sub-labels),
`labels` (kickers), `ph` (placeholder captions), and `quotes` (read by `main.typ`).

## Make it your own

The **code is MIT** — fork it. Our text, photos and logo are **not** licensed for reuse
([`NOTICE.md`](NOTICE.md)), so replace them with your own.

**1. Rebrand.** Edit `meta.couple` / `meta.date`, the `labels.*` and `cover.*` values in every
`lang/*.yaml`; swap `assets/ATB-logo*.png`; and tweak the palette/fonts at the top of
`components/styles.typ`.

**2. Change wording.** Edit the values in `lang/*.yaml` (see [Editing content](#editing-content)).
Keep keys identical across languages.

**3. Restructure the YAML for your event.** If you rename a top-level key (say `caserta` →
`paris`), you must also:
- update that section's `#let copy = strings.<key>` (and any `strings.<key>` references), **and**
- rename the key block in **every** `lang/*.yaml`.
Keys must match across all language files or the build fails.

**4. Rename a section.** Rename `sections/03_1_caserta_sights.typ` → then:
- update its `#include "sections/…"` line in `main.typ`;
- update its `strings.<key>` refs + rename the YAML key in **all** languages;
- rename its `assets/<folder>` and fix the `../assets/...` image paths inside the section.

**5. Add a section.** Copy an existing `sections/*.typ` as a template, then:
- add an `#include "sections/<new>.typ"` in `main.typ` at the desired position (mind the
  `quote-interlude(...)` lines between chapters);
- add its key block to **every** `lang/*.yaml`;
- add its `assets/<folder>` and reference the images.

**6. Remove a section.** Delete its `#include` line in `main.typ` (and the file), then remove its
YAML keys and its assets.

**7. Add a language.** Copy `lang/en.yaml` → `lang/<code>.yaml`, translate the **values** (keep
keys/markup), add `<code>` to the `langs=(…)` array in `build.sh`, and `./build.sh <code>`.

> Sanity check that languages stay in sync — the build errors on a missing key, and this quick
> diff flags drift:
> ```bash
> python3 -c "import yaml;k=lambda d:set((p:=lambda o,pre='':[x for kk,vv in o.items() for x in ([pre+kk]+(p(vv,pre+kk+'.') if isinstance(vv,dict) else []))])(d);\
> [print(l, k(yaml.safe_load(open(f'lang/{l}.yaml')))^k(yaml.safe_load(open('lang/en.yaml'))) or 'ok') for l in ('it','ro')]"
> ```

## Layout toolkit

Layout helpers live in `components/styles.typ`. The magazine body is assembled in `main.typ` from `sections/*.typ`, which call these helpers
(palette: `ivory`, `forest`, `ink`, `gold`, `mute`; fonts: `display-font` Didot, `text-font`
Avenir Next). Repeated values are named **design tokens** near the top (e.g. `placeholder-bg`,
`band-pad`, `frame-stroke`) — tweak layout there once, not scattered through the file.

| Helper | Use |
|--------|-----|
| `label`, `caption`, `divider`, `dropcap`, `hairline` | typographic primitives |
| `img-fill(path)` | cover-cropped image that fills its container |
| `placeholder(text)`, `placeholder-fill(text)` | grey stand-ins until a photo is ready |
| `feature(media, title:, body:, kicker:, url:, side:)` | in-flow photo + text module |
| `split-page(media, body, media-fr:, text-fr:, side:)` | full page split into image + ivory text panel |
| `hero-overlay(path, kicker:, title:, body:)` | full-bleed opener with text over a gradient scrim |
| `spread-band-left/-right(path, body, ratio:, body-at:)` | facing-page panorama band + content band |
| `timeline(items)`, `checklist(items)`, `aside(title, body)`, `quote-box`, `quote-page` | content blocks |
| `fit-to-width(body, size:)` | shrink a short title a notch so it stays on one line (baked into `feature`/`timeline`) |
| `fit-to-page(body, min-scale:)` | wrap a single-page section so a longer translation auto-fits one page |

### Keeping translations from breaking the layout

Other languages run longer, so two helpers auto-fit text — no per-string tuning:

- **Titles that would wrap** (feature cards, timeline entries) are already wrapped in
  `fit-to-width`, which drops the size a notch until the title fits on one line (down to a
  floor, then it wraps). Big Didot section headers are intentionally left to wrap.
- **A section that spills onto a second page**: wrap its whole body in `#fit-to-page[ … ]`
  (see `sections/04_1_getting_around.typ`). It uniformly scales the section down just enough to
  fit one page (min ~0.88, i.e. ≤ ~12% smaller; below that it lets the content flow). Only use
  it on a section that is meant to be a single self-contained page (one that starts on a fresh
  page and is followed by a page break / new-page section).

### Arranging a facing-page spread — `body-at`

`spread-band-left` / `spread-band-right` place one panorama across two facing pages as a top
image strip of height `ratio` (`ratio: 1` = full-page photo). The body (kicker/title/text) is
overlaid on the page and always stays on-page; `body-at` sets where it sits:

- `body-at: "bottom"` (default) — body at the foot of the page.
- `body-at: "top"` — body at the top of the page, over the image.

The body **overlaps the image as `ratio` grows** — use ivory text (`fill: ivory`) when it sits
over the photo (as the Amalfi opener does), and ink/forest when it sits on the ivory area.
Use `-left` on the left page and `-right` on the right so the image reads as one across the
gutter. Example (full-page photo with the caption over the top, see
`sections/03_3_amalfi_coast-sights.typ`):

```typst
#spread-band-left("../assets/…/photo.png", { /* ivory-coloured content */ }, ratio: 1, body-at: "top")
```
