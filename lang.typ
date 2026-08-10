// ============================================================================
//  Language plumbing — how content flows from lang/<code>.yaml into the pages.
//
//  Pick the language at COMPILE TIME:
//      typst compile --input lang=it main.typ out/wedding-it.pdf
//  (or just ./build.sh). Defaults to English. Add a language by dropping a
//  lang/<code>.yaml next to en.yaml (identical keys) and listing it in build.sh.
//  See CLAUDE.md → "Language plumbing & helpers" for the full guide.
// ============================================================================

#import "components/styles.typ": dropcap

// The selected language code, e.g. "en". Set with `--input lang=<code>`; default "en".
#let lang = sys.inputs.at("lang", default: "en")

// The whole content file, parsed into a dictionary. Read values by dotted path —
// e.g. `strings.napoli.intro`, `strings.meta.couple`. This is the ONLY source of words.
#let strings = yaml("lang/" + lang + ".yaml")

// markup(value): render a YAML string as INLINE Typst markup. Use it for (almost) every value
// you print, so `_italic_`, `*bold*`, `#link("url")[label]`, trailing `\` line breaks and
// blank-line paragraph breaks all work.  Example:  #markup(strings.napoli.intro)
#let markup(value) = eval(value, mode: "markup")

// markup-narrow(value): like markup() but ragged-right (justification off) with a little extra
// leading. Use inside NARROW columns (e.g. the two-column info panels) where justified text
// would open ugly gaps. Preserves paragraph breaks.  Example:  #markup-narrow(strings.info.transit_body)
#let markup-narrow(value) = {
  set par(justify: false, leading: 0.6em)
  eval(value, mode: "markup")
}

// lead-paragraph(value): render an opening paragraph with an editorial drop cap on its first
// letter — but only when the text begins with a plain letter (it falls back to normal markup
// when the text opens with markup like `_italic_`, so it never breaks). Use for the first
// paragraph of a section.  Example:  #lead-paragraph(strings.caserta.intro)
#let lead-paragraph(value) = {
  if value.match(regex("^\\p{L}")) != none {
    dropcap(value.slice(0, 1), eval(value.slice(1), mode: "markup"))
  } else {
    eval(value, mode: "markup")
  }
}
