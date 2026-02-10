#!/usr/bin/env zsh

BIN_DIR="$HOME/bin"

mkdir -p "BIN_DIR"

read -p $'What OS are you running?\n1) MacOs\n2) Linux Mint\nEnter your sys #:' sysNumber

case "$sysNumber" in
	"1")
		filePath="./macOS_commands/"
	;;
	"2")
		filePath="./linux_commands/"
	;;
	*)	
	echo "Invalid option: $sysNumber"
	;;
esac

for file in "$filePath"/*; do
	if [[ -f "$file" && "$file" == *.sh && "$file" != README.md && "$file" != init.sh ]]; then
		echo "chmod +x $file"
		chmod +x "$file"
		cp "$file" "$BIN_DIR/"
	fi
done



