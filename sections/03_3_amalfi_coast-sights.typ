#import "../components/styles.typ": *
#import "../lang.typ": strings, markup
#let copy = strings.amalfi

// ---- Opener: Amalfi view spanning the top half of two pages ---------------
#spread-band-left("../assets/03-3-amalfi-coast/amalfi-view.png", {}, ratio: 1)

#spread-band-right("../assets/03-3-amalfi-coast/amalfi-view.png", {
  label(strings.labels.amalfi_kicker, fill: gold)
  v(0.8em)
  text(font: display-font, size: 30pt, fill: ivory)[#copy.hero_title]
  v(0.8em)
  set par(justify: false, leading: 0.62em)
  text(fill: ivory)[#markup(copy.intro)]
}, ratio: 1, body-at: "top")

// ---- Highlights + Gastronomic ---------------------------------
#label(strings.ui.highlights, fill: gold)
#v(0.8em)
#feature(img-fill("../assets/03-3-amalfi-coast/positano-beach.png"),
  title: copy.positano.title, body: markup(copy.positano.body),
  url: "https://www.positano.com/en/e/positano", side: left, frac: 0.5, h: 5.2cm)

#feature(img-fill("../assets/03-3-amalfi-coast/sorrento.png"),
  title: copy.sorrento.title, body: markup(copy.sorrento.body),
  url: "https://www.amalfitouristoffice.it", side: right, h: 5cm)

#feature(img-fill("../assets/03-3-amalfi-coast/vietri-sul-mare.png"),
  title: copy.vietri.title, body: markup(copy.vietri.body),
  url: "https://www.vietrisulmare.it", side: left, h: 5cm)

#feature(img-fill("../assets/03-3-amalfi-coast/cetara.png"),
  title: copy.cetara.title, body: markup(copy.cetara.body),
  url: "https://www.positano.com/en/e/cetara", side: right, frac: 0.5, h: 5.2cm)

#pagebreak()

#v(0.3cm)
#label(strings.ui.food, fill: gold)
#v(0.9em)

#feature(img-fill("../assets/03-3-amalfi-coast/posides-pepata-cozze.png"),
  title: copy.posides.title, body: markup(copy.posides.body),
  url: "https://posides.res-discover.com", side: left, frac: 0.5, h: 5.6cm)

#feature(img-fill("../assets/03-3-amalfi-coast/amalfi-granita-limoncello.png"),
  title: copy.granita.title, body: markup(copy.granita.body),
  url: "https://www.amalficoast.com", side: right, h: 4.8cm)

#feature(img-fill("../assets/03-3-amalfi-coast/sal-de-riso-pastries.png"),
  title: copy.salderiso.title, body: markup(copy.salderiso.body),
  url: "https://www.pasticceriasalderiso.it/en/", side: left, h: 4.8cm)

#feature(img-fill("../assets/03-3-amalfi-coast/scialatielli.png"),
  title: copy.pasta.title, body: markup(copy.pasta.body),
  url: "https://www.amalficoast.com", side: right, frac: 0.5, h: 5.6cm)
