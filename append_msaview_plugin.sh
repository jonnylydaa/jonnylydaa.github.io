#!/usr/bin/env bash

CONFIG_FILE="$1"

if [ -z "$CONFIG_FILE" ]; then
    echo "Usage: $0 path/to/config.json"
    exit 1
fi

if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: File '$CONFIG_FILE' does not exist."
    exit 1
fi

# Insert the MsaView plugin block before the last closing brace
sed -i '' '$ i\
  ,"plugins": [\
    {\
      "name": "MsaView",\
      "url": "https://unpkg.com/jbrowse-plugin-msaview/dist/jbrowse-plugin-msaview.umd.production.min.js"\
    }\
  ]' "$CONFIG_FILE"

echo "MsaView plugin configuration inserted into $CONFIG_FILE"