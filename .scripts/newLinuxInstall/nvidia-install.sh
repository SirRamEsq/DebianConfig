#!/usr/bin/env bash
sudo apt install nvidia-driver nvidia-settings coreutils nvidia-xconfig
git clone https://github.com/nan0s7/nfancurve ~/nfancurve

echo "######################################################################################"
echo "Opening nvidia-xconfig once to generate default files"
echo "######################################################################################"
sudo nvidia-xconfig

echo ""
echo "Ensure coolbits are set by editing generated config file"
echo " https://github.com/nan0s7/nfancurve/blob/master/USAGE.md "
