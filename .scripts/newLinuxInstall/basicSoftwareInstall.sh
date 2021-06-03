#!/bin/bash

# Set working dir to HOME
cd ~

# Basic software install
sudo apt update
sudo apt install git curl zsh sakura tmux neovim ranger xfonts-utils flameshot nmap fortune cowsay python3 python3-pip curl wget dunst i3blocks ncmpcpp compton dmenu feh gsimplecal unclutter filezilla
sudo pip3 install neovim
sudo pip3 install pywal

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Snapd
sudo apt install snapd
sudo snap install core

## Emacs 27 through snapd
sudo snap install emacs --classic

### DOOM
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

#### DOOM Config
rm -r ~/.doom.d
git clone https://github.com/SirRamEsq/DoomEmacsConfig ~/.doom.d
~/.doom.d/update.sh

#### DOOM Install Fonts
sudo cp ~/.doom.d/fonts/*.ttf /usr/share/fonts/truetype
cd /usr/share/fonts/truetype 
sudo mkfontscale
sudo mkfontdir  
sudo fc-cache
sudo xset fp rehash
cd ~

# VLC
sudo apt install vlc

# Audacity
sudo apt install audacity

# Discord
sudo snap install discord
