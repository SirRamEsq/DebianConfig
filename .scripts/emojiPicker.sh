#/bin/sh
# Passes an entire list of emojis to dmenu
# Emojis can be ignored by appending a '#' at the end (grep will ignore these)

grep -v "#" ~/.config/emojis | dmenu  -i -l 20 -fn Monospace-18 | awk '{print $1}' | tr -d '\n' | xclip -selection clipboard

notify-send -t 1000 "Emoji" "$(xclip -o -selection clipboard) copied to clipboard"
