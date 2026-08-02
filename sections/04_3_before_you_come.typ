#import "../components/styles.typ": checklist, quote-box
#import "../lang.typ": strings, m
#let s = strings.before_you_come

= #s.heading

#m(s.intro)

#v(0.8em)

== #s.checklist_title

#v(0.4em)

#checklist(s.checklist.map(c => m(c)))

#v(1em)

== #s.rsvp_title

#v(0.3em)

#quote-box([#m(s.rsvp_body)])
