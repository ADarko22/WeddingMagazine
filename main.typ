#import "components/styles.typ": *
#import "lang.typ": lang, strings, markup

// Quote interludes = the full-page ivory quotes between chapters. Quotes live as a LIST in
// `strings.quotes`, so they are picked BY POSITION (0-based): quote-interlude(2) = the 3rd entry.
#let nth-quote(i) = strings.quotes.at(i)
#let quote-interlude(i) = quote-page(nth-quote(i).text, author: nth-quote(i).at("author", default: none))
// Same, but from an explicit markup string instead of the quotes list (e.g. the "explore" lines).
#let quote-interlude-text(txt) = quote-page(markup(txt))

// ---- Base page: ivory, generous margins, elegant folios ---------------------
#set page(
  paper: "a4",
  margin: (x: 2cm, top: 2cm, bottom: 1.8cm),
  fill: ivory,
  footer: align(center, folio()),
)
#set text(lang: lang, font: text-font, size: 9.5pt, fill: ink)
#set par(justify: true, leading: 0.62em)

#show heading.where(level: 1): it => block(below: 0.5em)[
  #text(font: display-font, size: 26pt, fill: forest, weight: "regular")[#it.body]
]
#show heading.where(level: 2): it => block(above: 1.1em, below: 0.55em)[
  #label(it.body, fill: gold, size: 8.5pt)
]

// ============================ EDITORIAL SEQUENCE ============================

#include "sections/01_cover.typ"                                  // Cover (placeholder)

#quote-interlude(2)                                                            // inside-cover: ivory quote

#include "sections/02_welcome.typ"                                // The Welcome (top band)

#include "sections/03_1_caserta_sights.typ"                       // Caserta (hero-overlay + 2 pp)
#quote-interlude-text(strings.caserta.explore)

#include "sections/03_2_napoli_sights.typ"                        // Napoli (spread-band)
#quote-interlude-text(strings.napoli.explore)

#include "sections/03_3_amalfi_coast-sights.typ"                  // Amalfi (spread-band)
#quote-interlude-text(strings.amalfi.explore)

#include "sections/04_1_wedding_day.typ"                          // The Celebration
#pagebreak()
#include "sections/04_2_getting_around.typ"                       // The Details
#include "sections/04_3_before_you_come.typ"                      // (top-band split, self-breaks)

#quote-interlude(5)                                                            // inside-cover: ivory quote

#include "sections/05_cover_back.typ"                             // Back cover
