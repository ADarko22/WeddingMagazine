#import "../components/styles.typ": sight-card, photo, photo-hero, quote-box
#import "../lang.typ": strings, m
#let s = strings.amalfi

= #s.heading

#m(s.intro)

#photo-hero(
  "../assets/03-3-amalfi-coast/amalfi-view.png",
  title: s.hero_title,
  h: 6.5cm,
)

== #strings.ui.highlights

#grid(
  columns: (1.1fr, 0.9fr),
  column-gutter: 1.2cm,
  [
    #sight-card(
      s.positano.title,
      m(s.positano.body),
      url: "https://www.positano.com/en/e/positano",
      img: photo("../assets/03-3-amalfi-coast/positano-beach.png", h: 9.6cm),
    )
  ],
  [
    #sight-card(
      s.sorrento.title,
      m(s.sorrento.body),
      url: "https://www.amalfitouristoffice.it",
      img: photo("../assets/03-3-amalfi-coast/sorrento.png", h: 4.7cm),
    )

    #sight-card(
      s.vietri.title,
      m(s.vietri.body),
      url: "https://www.vietrisulmare.it",
      img: photo("../assets/03-3-amalfi-coast/vietri-sul-mare.png", h: 4.7cm),
    )
  ],
)

#pagebreak()

== #strings.ui.food

#grid(
  columns: (1.1fr, 0.9fr),
  column-gutter: 1.2cm,
  [
    #sight-card(
      s.posides.title,
      m(s.posides.body),
      url: "https://posides.res-discover.com",
      img: photo("../assets/03-3-amalfi-coast/posides-pepata-cozze.png", h: 12.5cm),
    )
  ],
  [
    #sight-card(
      s.granita.title,
      m(s.granita.body),
      url: "https://www.amalficoast.com",
      img: photo("../assets/03-3-amalfi-coast/amalfi-granita-limoncello.png", h: 6.2cm),
    )

    #sight-card(
      s.salderiso.title,
      m(s.salderiso.body),
      url: "https://www.pasticceriasalderiso.it/en/",
      img: photo("../assets/03-3-amalfi-coast/sal-de-riso-pastries.png", h: 6.2cm),
    )
  ],
)

#v(0.8em)

#quote-box([#m(s.explore)])
