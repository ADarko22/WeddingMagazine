#import "../components/styles.typ": *
#import "../lang.typ": strings

#page(margin: 0pt, header: none, footer: none, fill: forest)[
  #set align(center + horizon)
  #block(width: 100%)[
    #image("../assets/ATB-logo.png", height: 6.6cm)

    #v(1.6em)
    #line(length: 2.4cm, stroke: 0.6pt + gold)
    #v(1.4em)

    #label(strings.labels.closing, fill: gold, size: 8pt)
    #v(0.9em)
    #text(font: display-font, size: 27pt, fill: ivory)[#strings.meta.couple]
    #v(0.8em)
    #text(font: text-font, size: 8.5pt, fill: rgb("#CFE0D3"), tracking: 4pt)[#upper(strings.meta.date)]
  ]
]
