#let title-font = "Times New Roman" // Or "Helvetica", "Arial", "Georgia"
#let primary-color = rgb("#1a365d")
#let accent-color = rgb("#c5a059")
#let backround-color = rgb("#059fc658")

#let quote-box(body) = {
  rect(
    width: 100%,
    
    stroke: (left: 3pt + accent-color),
    inset: 12pt,
    radius: (right: 4pt)
  )[#text(style: "italic", fill: primary-color)[#body]]
}

#let warning-box(title, body) = {
  rect(
    width: 100%,
    stroke: 1pt + rgb("#feb2b2"),
    inset: 10pt,
    radius: 4pt
  )[
    #text(weight: "bold", fill: rgb("#c53030"))[#title] \
    #text(size: 9.5pt)[#body]
  ]
}

// ---- Sights building blocks -------------------------------------------------

// A clickable item title. When `url` is given, the bold title becomes a
// hyperlink with a subtle accent underline and a small "↗" glyph; otherwise it
// renders as a plain bold title.
#let sight-title(title, url: none) = {
  let inner = text(font: title-font, weight: "bold", size: 11pt, fill: primary-color)[#title]
  block(below: 0.45em)[
    #if url == none {
      inner
    } else {
      link(url)[#underline(stroke: 0.6pt + accent-color, offset: 2pt)[#inner]#h(0.15em)#text(fill: accent-color, size: 8.5pt)[↗]]
    }
  ]
}

// A uniform, rounded photo slot. Fixed height + `fit: "cover"` keeps every card
// image the same size regardless of the source aspect ratio.
#let photo(path, h: 4cm) = block(
  width: 100%,
  radius: 4pt,
  clip: true,
  above: 0.2em,
  below: 0.6em,
)[#image(path, width: 100%, height: h, fit: "cover")]

// A styled placeholder that occupies the exact same footprint as `photo`, for
// sights whose real image is not in `assets/` yet.
#let photo-placeholder(label, h: 4cm) = block(
  width: 100%,
  height: h,
  radius: 4pt,
  fill: rgb("#e8eef2"),
  above: 0.2em,
  below: 0.6em,
)[#align(center + horizon)[#text(fill: rgb("#94a3b8"), style: "italic", size: 9pt)[#label]]]

// One sights entry, grouped so it never splits across a page/column break.
// `img` should be a `photo(...)` or `photo-placeholder(...)` (or `none`).
#let sight-card(title, body, url: none, img: none) = block(
  breakable: false,
  width: 100%,
  below: 1em,
)[
  #sight-title(title, url: url)
  #if img != none { img }
  #text(size: 9.5pt)[#body]
]

// A small italic caption line for photos.
#let caption(body) = block(above: 0.1em, below: 0.6em)[
  #align(center)[#text(size: 8.5pt, style: "italic", fill: rgb("#64748b"))[#body]]
]

// A two-column feature: photo on one side, title + longer body on the other.
// Grouped so it never splits across a break. `img-side` is "left" or "right".
#let sight-feature(title, body, img, url: none, img-side: left, img-width: 5.5cm) = block(
  breakable: false,
  width: 100%,
  below: 1.1em,
)[
  #let photo-cell = img
  #let text-cell = {
    sight-title(title, url: url)
    text(size: 10pt)[#body]
  }
  #if img-side == right {
    grid(columns: (1fr, img-width), column-gutter: 1cm, align: top,
      text-cell, photo-cell)
  } else {
    grid(columns: (img-width, 1fr), column-gutter: 1cm, align: top,
      photo-cell, text-cell)
  }
]

// A full-width hero photo with an optional location title overlaid bottom-left
// on a subtle dark gradient scrim. Title can be a hyperlink.
#let photo-hero(path, title: none, url: none, h: 7cm) = block(
  width: 100%,
  radius: 4pt,
  clip: true,
  above: 0.2em,
  below: 0.7em,
)[
  #image(path, width: 100%, height: h, fit: "cover")
  #if title != none {
    place(bottom + left, dx: 0pt, dy: 0pt, block(
      width: 100%,
      inset: (x: 14pt, y: 10pt),
      fill: gradient.linear(rgb("#00000000"), rgb("#000000b0"), angle: 90deg),
    )[
      #let label = text(font: title-font, weight: "bold", size: 15pt, fill: white)[#title]
      #if url == none { label } else { link(url)[#label] }
    ])
  }
]