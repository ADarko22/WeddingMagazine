# The Wedding Journal — Angelo & Teodora

A little multilingual magazine for our wedding guests: what to see, where to eat, and how to get
around Campania — plus the day's details. Typeset with [Typst](https://typst.app) and published
as a PDF per language.

**📖 Read it:** <https://adarko22.github.io/WeddingMagazine/> — **English · Italiano · Română**

## Make it yours (fork the template)

The **code is MIT-licensed** — fork it and build your own edition:

1. Replace the wording in `lang/<code>.yaml` with your own.
2. Replace the photos in `assets/` with your own — *our text, photos and logo are **not**
   licensed for reuse* (see [`NOTICE.md`](NOTICE.md)).
3. `./build.sh` → PDFs land in `out/`.

Full walkthrough — architecture, the helpers, and how to rename/add/remove sections and remap the
YAML — is in **[`CLAUDE.md` → Make it your own](CLAUDE.md#make-it-your-own)**.

## Build

```bash
./build.sh          # all languages -> out/wedding-<code>.pdf
./build.sh en       # a single language
```

Needs the Typst CLI (`brew install typst`) and the fonts **Didot** + **Avenir Next** (ship with
macOS). GitHub Actions builds all languages on push and publishes them to GitHub Pages.
Full authoring guide: [`CLAUDE.md`](CLAUDE.md).

## License & rights

- **Code & templates:** [MIT](LICENSE) — fork and customize freely.
- **Editorial content, our photos & the ATB logo:** © 2026 Angelo & Teodora, all rights
  reserved — not for reuse, alteration, or misrepresentation. See [`NOTICE.md`](NOTICE.md).
- **Third-party images:** used for personal, non-commercial illustration; © their respective
  owners; not covered by the MIT license. Credit/removal requests → open an issue. See
  [`NOTICE.md`](NOTICE.md).
