#import "../components/styles.typ": sight-card, photo, quote-box
#import "../lang.typ": strings, m
#let s = strings.caserta

= #s.heading

#m(s.intro)

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5cm,
  [
    == #strings.ui.highlights

    #sight-card(
      s.reggia.title,
      m(s.reggia.body),
      url: "https://reggiadicaserta.cultura.gov.it",
      img: photo("../assets/03-1-caserta/reggia-caserta.png", h: 7.2cm)
    )

    #sight-card(
      s.casertavecchia.title,
      m(s.casertavecchia.body),
      url: "https://www.borgando.it/campania/casertavecchia/",
      img: photo("../assets/03-1-caserta/casertavecchia-vicoli.png", h: 3.6cm),
    )

    #sight-card(
      s.anfiteatro.title,
      m(s.anfiteatro.body),
      url: "https://cultura.gov.it/luogo/anfiteatro-campano",
      img: photo("../assets/03-1-caserta/anfiteatro-campano.png", h: 3.6cm),
    )
  ],
  [
    == #strings.ui.food

    #sight-card(
      s.masanielli.title,
      m(s.masanielli.body),
      url: "https://www.pizzeriaimasanielli.it",
      img: photo("../assets/03-1-caserta/masanielli-pizza.png", h: 3.6cm),
    )

    #sight-card(
      s.pepe.title,
      m(s.pepe.body),
      url: "https://www.pepeingrani.it/en",
      img: photo("../assets/03-1-caserta/pepe-in-grani-pizza.png", h: 3.6cm),
    )

    #sight-card(
      s.lecolonne.title,
      m(s.lecolonne.body),
      url: "https://www.lecolonnemarziale.it",
      img: photo("../assets/03-1-caserta/le-colonne-pizza-al-contrario.png", h: 3.6cm),
    )

    #quote-box([#m(s.explore)])
  ],
)
