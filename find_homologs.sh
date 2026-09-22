#!/bin/bash

tblastn -query "$1" -subject "$2" \
-outfmt "6 qseqid sseqid pident length qlen" |
awk '$3 > 30 && $4 > 0.9 * $5' > "$3"

wc -l < "$3"
