#!/usr/bin/env bash

DEPS="deps"

source ./util

list_deps >> "$DEPS"

while IFS='' read -r line || [[ -n "$line" ]]; do
    echo "[ $line ]"
    echo "Size: `size "$line"`"
    pip show "$line" | grep -i requires
done < "$DEPS"
