#!/bin/bash
set -e

git clean -xi
echo "Cleaning up file modes"
find assets/ -type f -exec chmod -v 644 {} \;
find data/ -type f -exec chmod -v 644 {} ;

VERSION=$(jq .pack.description pack.mcmeta | sed -E 's/(.*v([0-9\.a-z]+).*)/\2/')
FILENAME=AppleNovaBradTextures."${VERSION}".zip

echo "Archiving files"
zip -r "${FILENAME}" assets data pack.mcmeta pack.png
mv "${FILENAME}" ../
echo "${FILENAME} created and moved to parent directory"
