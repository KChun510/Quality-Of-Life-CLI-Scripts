#!/bin/bash

BIN_DIR="$HOME/bin"

mkdir -p "$BIN_DIR"

read -p $'What OS are you running?\n1) macOS\n2) Linux Mint\nEnter your sys #: ' sysNumber

case "$sysNumber" in
  1)
    filePath="./macOS_commands"
    ;;
  2)
    filePath="./linux_commands"
    ;;
  *)
    echo "Invalid option: $sysNumber"
    exit 1
    ;;
esac

for file in "$filePath"/*; do
  [[ -f "$file" ]] || continue

  base="$(basename "$file")"

  if [[ "$base" == *.sh && "$base" != "init.sh" ]]; then
    echo "Making executable: $base"
    chmod +x "$file"
    cp "$file" "$BIN_DIR/"
  fi
done

echo 'export PATH="$HOME/bin:$PATH"'
echo "Add that line to your shell config if \$HOME/bin is not already in PATH."
