#import "../components/styles.typ": *
#import "../lang.typ": strings

// Placeholder cover: a forest full-bleed with the masthead + names, ready for a
// hero portrait (swap the fill for `img-fill(...)` + scrims once the photo is in).
#page(margin: 0pt, header: none, footer: none, fill: forest)[
  #place(center + horizon, text(font: text-font, size: 9pt, style: "italic",
    fill: rgb("#3A5648"), tracking: 1.5pt)[#strings.ph.hero_portrait])

  #place(top + center, dy: 2.2cm,
    text(font: text-font, size: 10pt, fill: ivory, tracking: 6pt)[#upper(strings.cover.title)])

  #place(top + center, dy: 3.9cm, block(width: 92%)[
    #set align(center)
    #text(font: display-font, size: 46pt, fill: ivory)[#strings.meta.couple]
  ])

  #place(bottom + center, dy: -2.1cm, block(width: 90%)[
    #set align(center)
    #line(length: 2.6cm, stroke: 0.6pt + gold)
    #v(0.8em)
    #text(font: text-font, size: 9pt, fill: ivory, tracking: 4pt)[
      #upper(strings.labels.cover_place) #h(0.5em) — #h(0.5em) #upper(strings.meta.date)
    ]
  ])
]
