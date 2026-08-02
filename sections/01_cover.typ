#import "../components/styles.typ": primary-color, accent-color
#import "../lang.typ": strings

#align(center + horizon)[
  #text(12pt, tracking: 3pt, fill: accent-color, weight: "bold")[#strings.cover.eyebrow]

  #text(32pt, weight: "light", fill: primary-color)[#strings.cover.title]

  #text(14pt, style: "italic", fill: primary-color)[#strings.cover.subtitle] \
  #text(22pt, weight: "bold", fill: accent-color)[#strings.meta.couple]

  #grid(
    columns: (auto, auto),
    gutter: 1cm,
    align: center + horizon,

    image("../assets/01-cover/angelo-avatar.png", width: 45%, height: 8cm, fit: "cover"),

    image("../assets/01-cover/teo-avatar.png", width: 50%, height: 8cm, fit: "cover")
  )
]
