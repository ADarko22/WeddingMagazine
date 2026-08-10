#import "../components/styles.typ": *
#import "../lang.typ": strings, markup, lead-paragraph
#let copy = strings.welcome

#let letter = {
  set par(justify: false, leading: 0.62em)
  label(strings.labels.welcome_kicker, fill: gold)
  v(1em)
  text(font: display-font, size: 27pt, fill: forest)[#copy.heading]
  v(0.4em)
  label(strings.labels.welcome_sub, fill: mute, size: 7pt)
  v(1.1em)
  lead-paragraph(copy.intro)
  v(1.1em)
  text(font: display-font, style: "italic", size: 14pt, fill: forest)[#markup(copy.quote)]
  v(1.1em)
  text(font: text-font, size: 8.5pt, style: "italic", fill: mute)[#markup(strings.ph.story_todo)]
}

#split-page(
  placeholder-fill(strings.ph.the_couple),
  letter,
  media-fr: 2, text-fr: 3, side: "top", valign: top, pad: 1.8cm,
)
