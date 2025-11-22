#!/bin/bash

# Get the current date and short git hash
DATE=$(date +'%Y%m%d')
HASH=$(git rev-parse --short HEAD 2>/dev/null)

if [ -z "$HASH" ]; then
    HASH="dev"
fi

VERSION="1.0.0-$DATE-$HASH"

# Update index.html
# We use sed to replace the line containing 'const GAME_VERSION ='
# This assumes the format: const GAME_VERSION = "some-version";
sed -i '' "s/const GAME_VERSION = \".*\";/const GAME_VERSION = \"$VERSION\";/" index.html

# Add index.html to the commit
git add index.html
