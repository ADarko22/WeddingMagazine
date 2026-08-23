// ============================================================================
//  EDITORIAL DESIGN SYSTEM — "The Wedding Journal"
//  Timeless European luxury fashion editorial. Didot × Avenir Next.
//
//  Layout toolkit only — all *content* lives in lang/<code>.yaml. See CLAUDE.md
//  for how to edit the magazine. Every helper below is used by main.typ /
//  sections/*.typ; keep it that way (add here only when a section needs it).
// ============================================================================

// ---- Palette ---------------------------------------------------------------
#let ivory  = rgb("#F4F1E8")   // warm paper
#let forest = rgb("#1C3B2E")   // deep forest green — headlines, labels
#let ink    = rgb("#141414")   // near-black — body text
#let gold   = rgb("#B08D4C")   // subtle champagne gold — hairline accents only
#let mute   = rgb("#6B6659")   // muted taupe — captions

// ---- Design tokens (named values reused across helpers) --------------------
#let placeholder-bg = rgb("#E6E1D4")               // grey fill for empty photo slots
#let overlay-ivory  = rgb("#EDEAE0")               // off-white body text over photos
#let band-pad       = (x: 2cm, top: 1.4cm, bottom: 1.6cm)  // content-band inset
#let frame-stroke   = 0.6pt + gold                 // hairline frame around photos
#let track-label    = 2.5pt                        // letter-spacing on small labels
#let track-kicker   = 3pt                          // letter-spacing on overlay kickers

// ---- Fonts -----------------------------------------------------------------
#let display-font = "Didot"       // dramatic headlines, masthead, italic quotes
#let text-font    = "Avenir Next" // clean modern sans — body & labels

// ---- Typographic primitives ------------------------------------------------

// Small uppercase editorial kicker / label with generous tracking.
#let label(txt, fill: forest, size: 8pt) = text(
  font: text-font, size: size, fill: fill, weight: "medium", tracking: track-label,
)[#upper(txt)]

// Thin hairline rule (gold by default).
#let hairline(length: 100%, stroke-color: gold, thickness: 0.6pt) = line(
  length: length, stroke: thickness + stroke-color,
)

// Small italic caption, muted.
#let caption(body, fill: mute) = block(above: 0.3em, below: 0.6em)[
  #text(font: text-font, size: 8pt, style: "italic", fill: fill)[#body]
]

// A minimal centered section divider: short gold rule.
#let divider(w: 1.6cm) = align(center)[#hairline(length: w)]

// Auto-fit: shrink `body` a notch until it fits on one line within the available width,
// down to `min` (then it wraps). `size` is the intended/maximum size. Keeps short titles
// from wrapping to an ugly second line when translated. Pass `body` WITHOUT a size.
#let fit-to-width(body, size: 13pt, min: 9.5pt, step: 0.5pt) = context layout(bounds => {
  let s = size
  while s > min and measure(text(size: s, body)).width > bounds.width { s = s - step }
  text(size: s, body)
})

// Marginal oversized initial (editorial "drop" cap) beside an opening paragraph.
#let dropcap(letter, body, size: 46pt) = grid(
  columns: (auto, 1fr),
  column-gutter: 0.4em,
  align: (top + left, top + left),
  text(font: display-font, size: size, fill: forest, baseline: 0.06em)[#letter],
  par(first-line-indent: 0pt)[#body],
)

// ---- Image helpers ---------------------------------------------------------

// A dark gradient scrim (for legible text over photos). `dir`: "top"|"bottom"|"full".
#let scrim(dir: "bottom", strength: 0.62) = {
  let dark = rgb(0, 0, 0, int(strength * 255))
  let clear = rgb(0, 0, 0, 0)
  if dir == "full" {
    rect(width: 100%, height: 100%, fill: dark, stroke: none)
  } else if dir == "top" {
    rect(width: 100%, height: 100%, stroke: none,
      fill: gradient.linear(dark, clear, angle: 90deg))
  } else {
    rect(width: 100%, height: 100%, stroke: none,
      fill: gradient.linear(clear, dark, angle: 90deg))
  }
}

// ---- Page numbers (folios) -------------------------------------------------

#let folio-pad = 1.2cm  // distance of the page number from the bottom edge (full-bleed pages)
// The page number, styled like the base footer. `fill`: mute on ivory, ivory over photos.
#let folio(fill: mute) = context text(
  font: text-font, size: 8pt, fill: fill, tracking: 2pt)[#counter(page).display()]
// Place the folio bottom-centre — for margin:0 pages that have no footer area.
#let place-folio(fill: mute) = place(bottom + center, dy: -folio-pad, folio(fill: fill))

// A full-bleed page (no margins, no header/footer). Background falls back to ink.
#let full-bleed(body) = page(margin: 0pt, header: none, footer: none, fill: ink)[
  #body
  #place-folio(fill: ivory)
]

// A full-bleed image with a large text block overlaid (kicker + Didot title +
// body), anchored bottom-left over a strong gradient scrim. For dramatic openers.
#let hero-overlay(path, kicker: none, title: none, body: none) = full-bleed[
  #block(width: 100%, height: 100%, clip: true)[
    #place(top + left, image(path, width: 100%, height: 100%, fit: "cover"))
    #place(bottom + left, box(width: 100%, height: 64%)[#scrim(dir: "bottom", strength: 0.80)])
    #place(bottom + left, dx: 1.9cm, dy: -1.9cm, block(width: 66%)[
      #set par(justify: false, leading: 0.6em)
      #if kicker != none [ #text(font: text-font, size: 8.5pt, fill: gold, tracking: track-kicker)[#upper(kicker)] \ #v(0.6em) ]
      #if title != none [ #text(font: display-font, size: 31pt, fill: ivory)[#title] #linebreak() #v(0.5em) ]
      #if body != none [ #text(font: text-font, size: 9.5pt, fill: overlay-ivory)[#body] ]
    ])
  ]
]

// Two-page spanning photo: a top image strip of height `ratio` (full page at ratio: 1),
// the panorama split across facing pages (image width 200%) so side "left"/"right" show the
// two halves across the gutter. The body is overlaid on the page and never leaves it:
// `body-at` "bottom" (default) sits it at the foot of the page, "top" at the top over the
// image. It overlaps the image as `ratio` grows — use ivory text when it sits over the photo.
#let spread-band(path, body, side: "left", ratio: 0.5, body-at: "bottom") = page(
  margin: 0pt, header: none, footer: none, fill: ivory,
)[
  #let img-anchor = if side == "right" { right + horizon } else { left + horizon }
  // Ivory number over a full photo (ratio 1), muted on the ivory band otherwise.
  #let folio-fill = if ratio >= 0.999 { ivory } else { mute }
  #place(top + left, box(width: 100%, height: ratio * 100%, clip: true)[
    #place(img-anchor, image(path, width: 200%, height: 100%, fit: "cover"))
  ])
  #place(top + left, box(width: 100%, height: 100%, inset: band-pad)[
    #set align(left + (if body-at == "top" { top } else { bottom }))
    #body
  ])
  #place-folio(fill: folio-fill)
]
// Facing-page convenience wrappers (existing signatures preserved).
#let spread-band-left(path, body, ratio: 0.5, body-at: "bottom") = spread-band(
  path, body, side: "left", ratio: ratio, body-at: body-at)
#let spread-band-right(path, body, ratio: 0.5, body-at: "bottom") = spread-band(
  path, body, side: "right", ratio: ratio, body-at: body-at)

// ---- Split-ratio editorial system -----------------------------------------

// Auto-fit: uniformly shrink `body` (reflowing) just enough to fit the height available
// where it is placed, down to `min-scale`; untouched if it already fits. Wrap a self-
// contained section so a longer translation doesn't push a near-empty extra page. Slight
// side effect on an overflowing page: everything is a little smaller and centered.
#let fit-to-page(body, min-scale: 0.88) = context layout(bounds => {
  let content = block(width: bounds.width, body)
  let sc = calc.min(1, bounds.height / measure(content).height)
  if sc >= 0.999 { content } else {
    scale(x: calc.max(sc, min-scale) * 100%, y: calc.max(sc, min-scale) * 100%,
      origin: top + center, reflow: true, content)
  }
})

// A cover-cropped image that fills its container (for split panels / placeholders).
#let img-fill(path) = image(path, width: 100%, height: 100%, fit: "cover")

// A full-area labelled placeholder (no asset file needed) — for split panels.
#let placeholder-fill(label-text) = block(width: 100%, height: 100%, fill: placeholder-bg)[
  #align(center + horizon)[
    #text(fill: mute, style: "italic", size: 11pt, tracking: 1.5pt)[#label-text]
  ]
]

// A small framed placeholder box for in-flow use.
#let placeholder(label-text, h: 6cm) = box(width: 100%, height: h, fill: placeholder-bg,
  stroke: frame-stroke)[
  #align(center + horizon)[#text(fill: mute, style: "italic", size: 9pt, tracking: 1pt)[#label-text]]
]

// THE core device: a full page split into image (`side`, `media-fr`:`text-fr` ratio,
// bleeds to the edges) and an ivory text panel in the remainder. `side`: "left" |
// "right" | "top" | "bottom". `media` is `img-fill(...)` or `placeholder-fill(...)`.
#let split-page(media, body, media-fr: 2, text-fr: 1, side: "left", valign: horizon, pad: 1.2cm) = {
  let total = media-fr + text-fr
  let mf = (media-fr / total) * 100%
  let tf = (text-fr / total) * 100%
  page(margin: 0pt, header: none, footer: none, fill: ivory)[
    #block(width: 100%, height: 100%)[
      #if side == "left" {
        place(top + left, box(width: mf, height: 100%, clip: true)[#media])
        place(top + right, box(width: tf, height: 100%, inset: pad)[
          #set align(left + valign)
          #body
        ])
      } else if side == "right" {
        place(top + right, box(width: mf, height: 100%, clip: true)[#media])
        place(top + left, box(width: tf, height: 100%, inset: pad)[
          #set align(left + valign)
          #body
        ])
      } else if side == "top" {
        place(top + left, box(width: 100%, height: mf, clip: true)[#media])
        place(bottom + left, box(width: 100%, height: tf, inset: pad)[
          #set align(left + valign)
          #body
        ])
      } else {
        place(bottom + left, box(width: 100%, height: mf, clip: true)[#media])
        place(top + left, box(width: 100%, height: tf, inset: pad)[
          #set align(left + valign)
          #body
        ])
      }
    ]
    #place-folio()
  ]
}

// An in-flow image + text module (framed image one side), airy above/below so
// headlines never clog. `media` is `img-fill(...)`; `frac` = image column share.
#let feature(media, title: none, body: none, kicker: none, url: none, side: left, frac: 0.56, h: 6cm) = block(
  breakable: false, width: 100%, above: 0.6em, below: 1.8em,
)[
  #let img-cell = box(width: 100%, height: h, clip: true, stroke: frame-stroke)[#media]
  #let title-render = {
    let t = fit-to-width(text(font: display-font, fill: gold)[#title], size: 13pt)
    if url == none { t } else { link(url, {t}) }
  }
  #let txt-cell = {
    set par(justify: false, leading: 0.6em)
    if kicker != none { label(kicker, fill: gold, size: 7.5pt); v(0.6em) }
    block(below: 0.4em, title-render)
    v(0.5em)
    text(font: text-font, size: 9pt, fill: ink)[#body]
  }
  #if side == left {
    grid(columns: (frac * 1fr, (1 - frac) * 1fr), column-gutter: 1cm, align: horizon,
      img-cell, txt-cell)
  } else {
    grid(columns: ((1 - frac) * 1fr, frac * 1fr), column-gutter: 1cm, align: horizon,
      txt-cell, img-cell)
  }
]

// ---- Editorial content helpers --------------------------------------------

// Vertical timeline: `items` is a list of (time, title, detail) arrays.
#let timeline(items) = {
  for it in items {
    block(below: 1em, breakable: false)[
      #grid(
        columns: (1.2cm, auto, 1fr),
        column-gutter: 1.2em,
        align: (right + top, center + top, left + top),
        text(font: text-font, size: 10pt, fill: gold, tracking: 1pt)[#it.at(0)],
        text(fill: gold)[•],
        [
          #fit-to-width(text(font: display-font, fill: forest)[#it.at(1)], size: 13pt)
          #text(font: text-font, size: 9pt, fill: ink)[#it.at(2)]
        ],
      )
    ]
  }
}

// Simple checklist with a gold tick per item.
#let checklist(items) = {
  for it in items {
    block(below: 0.8em)[
      #grid(columns: (auto, 1fr), column-gutter: 0.6em, align: (top, top),
        text(fill: gold)[—],
        text(font: text-font, size: 9.5pt, fill: ink)[#it])
    ]
  }
}

// An understated aside note (hairline-bracketed, no colour alarm).
#let aside(title, body) = block(width: 100%, inset: (y: 4pt))[
  #hairline()
  #v(0.5em)
  #label(title, fill: forest, size: 8.5pt)
  #v(0.4em)
  #text(font: text-font, size: 9pt, fill: ink)[#body]
  #v(0.5em)
  #hairline()
]

// A quiet quote aside on ivory (left gold rule).
#let quote-box(body) = block(width: 100%, inset: (left: 12pt), stroke: (left: 1.2pt + gold))[
  #text(font: display-font, style: "italic", size: 12pt, fill: forest)[#body]
]

// A near-empty ivory quote page (used for the interludes in main.typ).
#let quote-page(body, author: none) = page(header: none, footer: align(center, folio()))[
  #set align(center + horizon)
  #block(width: 74%)[
    #divider()
    #v(1.2em)
    #text(font: display-font, style: "italic", size: 22pt, fill: forest)[#body]
    #if author != none { v(1em); label(author, fill: gold) }
    #v(1.2em)
    #divider()
  ]
]
