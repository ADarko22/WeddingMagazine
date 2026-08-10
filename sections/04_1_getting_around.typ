#import "../components/styles.typ": *
#import "../lang.typ": strings, markup, markup-narrow
#let copy = strings.info

#show link: it => text(fill: gold)[#underline(it)]

// Wrapped so a longer translation auto-fits one page instead of spilling to a second.
#fit-to-page[
#v(0.4cm)

#align(center)[
  #label(strings.labels.details_kicker, fill: gold)
  #v(0.7em)
  #text(font: display-font, size: 29pt, fill: forest)[#copy.heading]
]

#v(0.9em)

#grid(
  columns: (1.25fr, 0.75fr),
  column-gutter: 1.3cm,
  align: (left + top, left + top),
  [
    #box(width: 100%, height: 8.2cm, clip: true, stroke: 0.6pt + gold)[
      #image("../assets/04-info/info-map.png", width: 100%, height: 100%, fit: "contain")
    ]
    #v(0.3em)
    #caption(markup(copy.map_caption))
  ],
  [
    #par(justify: false)[#text(fill: ink)[#markup(copy.intro)]]
    #v(0.8em)
    #placeholder(strings.ph.detail_photo, h: 4.4cm)
  ],
)

#v(1em)

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.4cm,
  [
    #label(copy.accommodations_title, fill: forest, size: 8pt)
    #v(0.4em)
    #markup-narrow(copy.accommodations_body)
  ],
  [
    #label(copy.transit_title, fill: forest, size: 8pt)
    #v(0.4em)
    #markup-narrow(copy.transit_body)
  ],
)

#v(1em)

#aside(copy.warning_title)[#markup(copy.warning_body)]

#v(0.6em)

#quote-box([#markup(copy.recommendations)])
]
