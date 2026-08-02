#import "../components/styles.typ": title-font, primary-color, quote-box
#import "../lang.typ": strings, m

#show heading: it => [
  #text(font: title-font, fill: primary-color, weight: "bold")[#it.body]
  #v(0.3em)
]

= #strings.welcome.heading

#v(0.3em)

#m(strings.welcome.intro)

#v(0.8em)

#quote-box([#m(strings.welcome.quote)])

#v(1fr)

#align(center)[
  #block(radius: 6pt, clip: true, stroke: 0.5pt + rgb("#e2e8f0"))[
    #image("../assets/02-welcome/Angelo-Teo-Sion.jpeg", height: 15.5cm)
  ]

  #v(0.9em)

  #text(size: 10.5pt, style: "italic", fill: primary-color)[#m(strings.welcome.turn_page)]
]

#v(1fr)
