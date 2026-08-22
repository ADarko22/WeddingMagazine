#import "../components/styles.typ": *
#import "../lang.typ": strings, markup
#let copy = strings.napoli

// ---- Opener: Posillipo spanning the top half of pages 8–9 -----------------
#spread-band-left("../assets/03-2-napoli/napoli-posillipo.png", {
  label(strings.labels.napoli_kicker, fill: gold)
  v(0.8em)
  text(font: display-font, size: 32pt, fill: forest)[Napoli]
  v(0.8em)
  set par(justify: false, leading: 0.62em)
  text(fill: ink)[#markup(copy.intro)]
}, ratio: 0.63)

#spread-band-right("../assets/03-2-napoli/napoli-posillipo.png", {
  label(strings.ui.highlights, fill: gold)
  v(0.8em)
  feature(img-fill("../assets/03-2-napoli/napoli-centro.png"),
    title: copy.centro.title, body: markup(copy.centro.body),
    url: "https://visit-napoli.com/cosa-vedere-napoli", side: left, h: 3.7cm)
  feature(img-fill("../assets/03-2-napoli/napoli-metro-toledo.png"),
    title: copy.toledo.title, body: markup(copy.toledo.body),
    url: "https://metroart.anm.it/stazioni-arte/2018-02-12-14-33-22/toledo.html", side: right, h: 3.7cm)
}, ratio: 0.63)

// ---- Gastronomic Tips ------------------------------------------------------
#v(0.3cm)
#label(strings.ui.food, fill: gold)
#v(0.9em)

#feature(img-fill("../assets/03-2-napoli/napoli-poppella-fiocco.png"),
  title: copy.poppella.title, body: markup(copy.poppella.body),
  url: "https://www.pasticceriapoppella.com", side: left, h: 5.2cm)

#feature(img-fill("../assets/03-2-napoli/napoli-passione-sofi.png"),
  title: copy.passione.title, body: markup(copy.passione.body),
  url: "https://www.passionedisofi.it", side: right, h: 4.8cm)

#feature(img-fill("../assets/03-2-napoli/napoli-sfogliatella-attanasio.png"),
  title: copy.sfogliatella.title, body: markup(copy.sfogliatella.body),
  url: "https://www.sfogliatelleattanasio.it", side: left, h: 4.8cm)

#feature(img-fill("../assets/03-2-napoli/da-michele.png"),
  title: copy.damichele.title, body: markup(copy.damichele.body),
  url: "https://www.damichele.net/sede-di-napoli", side: right, h: 5.2cm)
