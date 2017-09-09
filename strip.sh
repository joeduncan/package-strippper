#!/bin/bash -e
# clean up excess baggage in node_modules
echo "Stripping packages in $(pwd)/node_modules"
cd node_modules
BEFORE=$(du -h | tail -1 | cut -f1)

find . -type f -path "*/test/*" -exec rm -rf {} \;
find . -type f -path "*/docs/*" -exec rm -rf {} \;
find . -type f -path "*/doc/*" -exec rm -rf {} \;
find . -type f -path "*/*gh-pages*/*" -exec rm -rf {} \;
find . -type f -path "*/lcov-report/*" -exec rm -rf {} \;

find . -type f -not \( \
-iname \*.json \
-o -iname \*.js \
-o -iname \*.node \
-o -iname \*.css \
-o -iname \*.scss \
-o -iname \*.eot \
-o -iname \*.png \
-o -iname \*.woff \
-o -iname \*.woff2 \
-o -iname \*.gif \
-o -iname \*.svg \
-o -iname \*.ttf \
-o -iname \*.jpg \) \
-exec rm -rf {} \;

AFTER=$(du -h | tail -1 | cut -f1)

echo "Done. Reduced from $BEFORE to $AFTER"
