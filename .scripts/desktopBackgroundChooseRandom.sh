#!/usr/bin/env bash

dir="$HOME/Pictures/Desktops"
find $dir -type f \( -iname \*.jpg -o -iname \*.png -o -iname \*.jpeg \) | shuf -n1
