#!/bin/bash

VERSION=$(cat pack.mcmeta | grep -E -o 'v[0-9\.a-z]+' | sed -e 's/v//')
find assets/ -name '.DS_Store' -exec rm -fv {} \;
find assets/ -type f -exec chmod -v 644 {} \;
zip -r AppleNovaBradTextures."$VERSION".zip assets pack.mcmeta pack.png
mv AppleNovaBradTextures."$VERSION".zip ../
