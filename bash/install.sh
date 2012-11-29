#!/bin/bash
# Set up Bash preferences

target_directory="$HOME"

for f in $(find . -type f); do
	echo "$f"
done