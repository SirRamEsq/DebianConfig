#!/bin/bash

###
### For Debian systems
### See here: https://lottalinuxlinks.com/how-to-build-and-install-i3-gaps-on-debian/
###

# Install dependencies for i3 (IMPORTANT)
sudo apt install i3

# Install dependencies for i3-gaps

sudo apt install meson dh-autoreconf libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-shape0 libxcb-shape0-dev

# Move to home
cd ~

# make dir for working in to install dependency
mkdir temp-i3-gaps-dependency-install
cd temp-i3-gaps-dependency-install
git clone https://github.com/Airblader/xcb-util-xrm
cd xcb-util-xrm
git submodule update --init
./autogen.sh --prefix=/usr
make
sudo make install

cd ..
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
git checkout gaps && git pull
rm -rf ./build
mkdir ./build
cd build
meson --prefix /usr/local
sudo ninja install

echo "Remember to set the xrandr setup scrip at ~/xrandrSetup.sh"
echo "Should be something like xrandr --output HDMI-0 --auto --right-of DVI-D-0 "
echo "invoke 'xrandr' to get display options"
