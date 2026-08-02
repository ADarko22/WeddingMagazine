#import "../components/styles.typ": timeline, primary-color
#import "../lang.typ": strings, m
#let s = strings.wedding_day

#let label(t) = text(weight: "bold", fill: primary-color)[#t]

= #s.heading

#m(s.intro)

#v(0.8em)

== #s.timeline_title

#v(0.3em)

#timeline(s.timeline)

#v(0.9em)

== #s.details_title

#v(0.3em)

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5cm,
  [
    #label(s.venue_label) \
    #m(s.venue_body)

    #v(0.8em)

    #label(s.contact_label) \
    #m(s.contact_body)
  ],
  [
    #label(s.shuttle_label) \
    #m(s.shuttle_body)
  ],
)
