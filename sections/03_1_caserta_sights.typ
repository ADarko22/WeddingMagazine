#import "../components/styles.typ": *
#import "../lang.typ": strings, markup, lead-paragraph
#let copy = strings.caserta

// ---- Opener: full-bleed Reggia with text overlaid -------------------------
#hero-overlay(
  "../assets/03-1-caserta/reggia-caserta.png",
  kicker: strings.labels.caserta_kicker,
  title: copy.reggia.title,
  body: markup(copy.reggia.body),
)

// ---- Local Highlights ------------------------------------------------------
#v(0.3cm)
= #copy.heading

#v(1.2em)
#pad(right: 10%)[#lead-paragraph(copy.intro)]

#v(1.2em)
#label(strings.ui.highlights, fill: gold)
#v(0.9em)

#feature(img-fill("../assets/03-1-caserta/casertavecchia-vicoli.png"),
  title: copy.casertavecchia.title, body: markup(copy.casertavecchia.body),
  url: "https://www.borgando.it/campania/casertavecchia/", side: left, h: 5.4cm)

#feature(img-fill("../assets/03-1-caserta/anfiteatro-campano.png"),
  title: copy.anfiteatro.title, body: markup(copy.anfiteatro.body),
  url: "https://cultura.gov.it/luogo/anfiteatro-campano", side: right, h: 5.4cm)

#pagebreak()

// ---- Gastronomic Tips ------------------------------------------------------
#v(0.3cm)
#label(strings.ui.food, fill: gold)
#v(0.9em)

#feature(img-fill("../assets/03-1-caserta/masanielli-pizza.png"),
  title: copy.masanielli.title, body: markup(copy.masanielli.body),
  url: "https://www.pizzeriaimasanielli.it", side: left, h: 4.8cm)

#feature(img-fill("../assets/03-1-caserta/pepe-in-grani-pizza.png"),
  title: copy.pepe.title, body: markup(copy.pepe.body),
  url: "https://www.pepeingrani.it/en", side: right, h: 4.8cm)

#feature(img-fill("../assets/03-1-caserta/le-colonne-pizza-al-contrario.png"),
  title: copy.lecolonne.title, body: markup(copy.lecolonne.body),
  url: "https://www.lecolonnemarziale.it", side: left, h: 4.8cm)
