// Language resolver. Pick the language at compile time with:
//   typst compile --input lang=it main.typ out/wedding-it.pdf
// Defaults to English. Add a language by dropping a lang/<code>.yaml next to en.yaml.

#let lang = sys.inputs.at("lang", default: "en")
#let strings = yaml("lang/" + lang + ".yaml")

// Render a string that contains Typst markup (_italic_, *bold*, #link[...], line breaks).
#let m(s) = eval(s, mode: "markup")
