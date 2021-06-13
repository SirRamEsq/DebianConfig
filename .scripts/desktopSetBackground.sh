#!/usr/bin/env bash

# Pipe file name into this txt file
rm ~/.config/desktop-image.txt
echo $1 >> ~/.config/desktop-image.txt

# Set terminal colors using wal
cat ~/.config/desktop-image.txt | xargs wal -i
# Set background using feh
cat ~/.config/desktop-image.txt | xargs feh --bg-fill
