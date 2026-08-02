#import "../components/styles.typ": caption, warning-box, quote-box, accent-color
#import "../lang.typ": strings, m
#let s = strings.info

#show link: it => text(fill: accent-color)[#underline(it)]

= #s.heading

#m(s.intro)

#align(center)[
  #block(radius: 6pt, clip: true, stroke: 0.5pt + rgb("#e2e8f0"))[
    #image("../assets/04-info/info-map.png", height: 10.5cm)
  ]
]

#caption([#m(s.map_caption)])

#v(0.4em)

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5cm,
  [
    == #s.accommodations_title

    #m(s.accommodations_body)
  ],
  [
    == #s.transit_title

    #m(s.transit_body)
  ],
)

#v(0.4em)

#warning-box(s.warning_title)[#m(s.warning_body)]

#v(0.6em)

#quote-box([#m(s.recommendations)])
