#!/usr/bin/env bash
# Build the wedding magazine in every language.
# Usage: ./build.sh            (builds all languages into out/)
#        ./build.sh en it      (builds only the given languages)
#
# Needs the Typst CLI. Install it once with:  brew install typst
# (the VS Code Tinymist extension does NOT provide a command-line binary.)
# If typst lives somewhere off your PATH, point at it:  TYPST=/path/to/typst ./build.sh
#
# Pinned/tested Typst version: 0.15.1 (CI installs exactly this — see
# .github/workflows/build.yml). Newer Typst may change layout; upgrade deliberately.
# Fonts: Didot + Avenir Next (ship with macOS). On other OSes install/substitute them.
set -euo pipefail

cd "$(dirname "$0")"

# Resolve a typst binary: $TYPST override, then PATH, then common install spots.
TYPST="${TYPST:-}"
if [ -z "$TYPST" ]; then
  if command -v typst >/dev/null 2>&1; then
    TYPST="$(command -v typst)"
  else
    for c in /opt/homebrew/bin/typst /usr/local/bin/typst "$HOME/.cargo/bin/typst"; do
      [ -x "$c" ] && TYPST="$c" && break
    done
  fi
fi

if [ -z "$TYPST" ] || ! "$TYPST" --version >/dev/null 2>&1; then
  echo "error: typst CLI not found." >&2
  echo "  Install it with:  brew install typst" >&2
  echo "  or download from: https://github.com/typst/typst/releases" >&2
  echo "  or run:           TYPST=/path/to/typst ./build.sh" >&2
  exit 1
fi

mkdir -p out

langs=("$@")
if [ ${#langs[@]} -eq 0 ]; then
  langs=(en it ro)   # add new language codes here (must match lang/<code>.yaml)
fi

for l in "${langs[@]}"; do
  echo "Building $l ..."
  "$TYPST" compile --input lang="$l" main.typ "out/wedding-$l.pdf"
done

echo "Done. PDFs are in out/"
