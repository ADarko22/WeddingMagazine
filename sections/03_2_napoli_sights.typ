#import "../components/styles.typ": sight-card, photo, quote-box
#import "../lang.typ": strings, m
#let s = strings.napoli

= #s.heading

#m(s.intro)

#photo("../assets/03-2-napoli/napoli-posillipo.png", h: 6cm)
#align(center)[#text(size: 8.5pt, style: "italic", fill: rgb("#64748b"))[#m(s.caption)]]

#v(0.4em)

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5cm,
  [
    == #strings.ui.highlights

    #sight-card(
      s.centro.title,
      m(s.centro.body),
      url: "https://visit-napoli.com/cosa-vedere-napoli",
      img: photo("../assets/03-2-napoli/napoli-centro.png"),
    )

    #sight-card(
      s.toledo.title,
      m(s.toledo.body),
      url: "https://metroart.anm.it/stazioni-arte/2018-02-12-14-33-22/toledo.html",
      img: photo("../assets/03-2-napoli/napoli-metro-toledo.png"),
    )

    #quote-box([#m(s.explore)])
  ],
  [
    == #strings.ui.food

    #sight-card(
      s.poppella.title,
      m(s.poppella.body),
      url: "https://www.pasticceriapoppella.com",
      img: photo("../assets/03-2-napoli/napoli-poppella-fiocco.png"),
    )

    #sight-card(
      s.passione.title,
      m(s.passione.body),
      url: "https://www.passionedisofi.it",
      img: photo("../assets/03-2-napoli/napoli-passione-sofi.png"),
    )

    #sight-card(
      s.sfogliatella.title,
      m(s.sfogliatella.body),
      url: "https://www.sfogliatelleattanasio.it",
      img: photo("../assets/03-2-napoli/napoli-sfogliatella-attanasio.png"),
    )
  ],
)
