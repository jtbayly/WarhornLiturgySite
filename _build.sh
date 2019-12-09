#!/bin/sh

set -ev

Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::epub_book')"

sed -e "s/div.sourceCode/blockquote/" ./_book/libs/gitbook-2.6.7/js/plugin-clipboard.js > ./_book/libs/gitbook-2.6.7/js/plugin-clipboard_new.js
mv ./_book/libs/gitbook-2.6.7/js/plugin-clipboard_new.js ./_book/libs/gitbook-2.6.7/js/plugin-clipboard.js
