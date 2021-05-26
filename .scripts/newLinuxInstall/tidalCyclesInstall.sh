#!/usr/bin/env bash

sudo apt-get install build-essential cabal-install git jackd2
git clone https://github.com/lvm/build-supercollider ~/supercollider-build
sh ~/supercollider-build/build-supercollider.sh
sh ~/supercollider-build/build-sc3-plugins.sh
cabal update
cabal install tidal
xdg-open https://tidalcycles.org/Linux_installation
scide
