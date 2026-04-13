#!/bin/bash

TARGET_DIR="${1:-.}"
TARGET_DIR="$(realpath "$TARGET_DIR")"
out_file="$TARGET_DIR/out.txt"

if [[ -f "$out_file" ]]; then
  rm "$out_file"
fi

touch $out_file

for file in "$TARGET_DIR"/*; do
  if [[ -f "$file" && "$file" != $out_file && ("$file" == *.txt || "$file" == *.md) ]]; then
    echo -e "\n<-------- ${file##*/} -------->\n" >> $out_file;
    cat "$file" >> $out_file;
  fi
done
