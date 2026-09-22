#!/bin/bash
#another test for revert

query_length=$(awk '!/^>/ {n += length($0)} END {print n}' "$1")

tblastn -query "$1" -subject "$2" -outfmt 6 |
awk -v qlen="$query_length" '$3 > 30 && $4 > 0.9 * qlen' > "$3"

wc -l < "$3"
