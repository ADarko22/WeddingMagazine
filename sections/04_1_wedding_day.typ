#import "../components/styles.typ": *
#import "../lang.typ": strings, markup, markup-narrow
#let copy = strings.wedding_day

#v(0.5cm)

#align(center)[
  #label(strings.labels.celebration_kicker, fill: gold)
  #v(0.8em)
  #text(font: display-font, size: 33pt, fill: forest)[#copy.heading]
]

#v(1em)

#pad(x: 10%)[#align(center)[#par(justify: false)[#text(fill: ink)[#markup(copy.intro)]]]]

#v(1.5em)

#grid(
  columns: (1.05fr, 0.95fr),
  column-gutter: 0.8cm,
  align: (left + top, left + top),
  [
    #label(copy.timeline_title, fill: gold, size: 8.5pt)
    #v(0.9em)
    #timeline(copy.timeline)
  ],
  [
    #box(width: 100%, height: 10.6cm, clip: true, stroke: 0.6pt + gold)[
      #image("../assets/04-info/villa-althea4.png", width: 100%, height: 100%)
    ]
  ],
)

#v(1.4em)

#label(copy.details_title, fill: gold, size: 8.5pt)
#v(0.7em)

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 0.8cm,
  [
    #label(copy.venue_label, fill: forest, size: 7.2pt)
    #v(0.4em)
    #markup-narrow(copy.venue_body)
  ],
  [
    #label(copy.shuttle_label, fill: forest, size: 7.2pt)
    #v(0.4em)
    #markup-narrow(copy.shuttle_body)
  ],
  [
    #label(copy.contact_label, fill: forest, size: 7.2pt)
    #v(0.4em)
    #markup-narrow(copy.contact_body)
  ],
)
