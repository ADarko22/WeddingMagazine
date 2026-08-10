#import "../components/styles.typ": *
#import "../lang.typ": strings, markup
#let copy = strings.before_you_come

#let body = {
  set par(justify: false, leading: 0.6em)
  label(strings.labels.details_kicker, fill: gold)
  v(1em)
  text(font: display-font, size: 30pt, fill: forest)[#copy.heading]
  v(0.9em)
  text(fill: ink)[#markup(copy.intro)]
  v(1.4em)
  label(copy.checklist_title, fill: gold, size: 8pt)
  v(0.7em)
  checklist(copy.checklist.map(c => markup(c)))
  v(1.2em)
  label(copy.rsvp_title, fill: gold, size: 8pt)
  v(0.6em)
  quote-box([#markup(copy.rsvp_body)])
}

#split-page(
  placeholder-fill(strings.ph.detail_photo),
  body,
  media-fr: 2, text-fr: 3, side: "top", valign: top, pad: 1.8cm,
)
