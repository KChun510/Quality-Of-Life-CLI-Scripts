#!/usr/bin/env zsh

BIN_DIR="$HOME/bin"

mkdir -p "BIN_DIR"

for file in *; do
	if [[ -f "$file" && "$file" == *.sh && "$file" != README.md && "$file" != init.sh ]]; then
		echo "chmod +x $file"
		chmod +x "$file"
		cp "$file" "$BIN_DIR/"
	fi
done
