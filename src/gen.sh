#!/bin/bash

set -euo pipefail

for directory in documents/source; do
    find $directory -name '*.md' -print0 | while IFS= read -r -d '' file; do
        echo "Processing $file"

        pandoc "$file" \
            -F node_modules/.bin/mermaid-filter \
            -H /app/config/header.tex \
            --toc --toc-depth=2 \
            --pdf-engine=xelatex \
            -o "output/${file/%md/pdf}"

        pandoc "$file" \
            -F node_modules/.bin/mermaid-filter \
            -H /app/config/header.tex \
            --toc --toc-depth=2 \
            -o "output/${file/%md/docx}"
    done
done
