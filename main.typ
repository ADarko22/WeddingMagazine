#import "components/styles.typ": primary-color, backround-color

#let wedding-date = "MAY 13th 2028"

#set page(
  paper: "a4",
  margin: (x: 1.5cm, top: 1cm, bottom: 1cm),
  header: align(right)[
    #text(8pt, fill: primary-color, tracking: 1pt, style: "italic")[ANGELO & TEODORA • #wedding-date]
  ],
  background: rect(
    width: 100%,
    height: 100%,
    fill: backround-color
  )
)

#set text(font: "Georgia", size: 10.5pt, fill: rgb("#2c3e50"))

#include "sections/01_cover.typ"
#pagebreak()

#include "sections/02_welcome.typ"
#pagebreak()

#include "sections/03_1_caserta_sights.typ"
#pagebreak()

#include "sections/03_2_napoli_sights.typ"
#pagebreak()

#include "sections/04_info.typ"
#pagebreak()

#include "sections/05_cover_back.typ"
