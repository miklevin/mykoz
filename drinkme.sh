#!/bin/bash

COUNTER=0
URL="https://raw.githubusercontent.com/miklevin/drinkme/main/install.sh?cache=$COUNTER"
FILENAME="install.sh"

curl -s -o "$FILENAME" "$URL" -H "Cache-Control: no-cache, no-store, must-revalidate" -H "Pragma: no-cache" -H "Expires: 0" --proxy-header "Cache-Control: no-cache" --proxy-header "Cache-Control: no-store"

