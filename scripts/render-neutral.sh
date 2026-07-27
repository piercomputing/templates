#!/usr/bin/env bash
# render-neutral.sh <template-dir> <dest-dir>
#
# Renders one template directory with neutral values: .tmpl files have their
# Go-template actions substituted and the suffix stripped; everything else is
# copied verbatim. This produces the directly-buildable tree that CI builds
# and the pier-template-<id> repositories contain.
#
# Neutral values derive from the template id (dir basename):
#   node_hono → slug "node-hono", name "Node Hono".
# The Pier scaffolder substitutes real names client-side; a repo generated
# from the public template simply keeps the neutral ones until edited.
set -euo pipefail

src="${1:?usage: render-neutral.sh <template-dir> <dest-dir>}"
dest="${2:?usage: render-neutral.sh <template-dir> <dest-dir>}"

id="$(basename "$src")"
slug="${id//_/-}"
# "node-hono" → "Node Hono"
name="$(echo "$slug" | tr '-' ' ' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)}1')"

mkdir -p "$dest"
(cd "$src" && find . -type f) | while IFS= read -r f; do
  rel="${f#./}"
  out="$dest/$rel"
  mkdir -p "$(dirname "$out")"
  case "$rel" in
    *.tmpl)
      out="${out%.tmpl}"
      sed -e "s/{{\.AppName}}/$name/g" \
          -e "s/{{\.AppSlug}}/$slug/g" \
          -e "s/{{\.SiteName}}/$name/g" \
          -e "s/{{\.SiteSlug}}/$slug/g" \
          "$src/$rel" > "$out"
      if grep -q '{{\.' "$out"; then
        echo "error: unrendered template action left in $out" >&2
        exit 1
      fi
      ;;
    *)
      cp "$src/$rel" "$out"
      ;;
  esac
done
