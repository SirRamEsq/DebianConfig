#!/usr/bin/env bash

# See https://vitux.com/debian_samba/
echo ""
echo "Installing software"
sudo apt install cifs-utils

echo ""
echo "Creating mount location"
sudo mkdir /media/samba_share

echo ""
# echo "Copying .smbcredentials to home folder"
# cp ./.smbcredentials ~/.smbcredentials
echo "Copying .smbcredentials to root home folder"
sudo cp ./.smbcredentials /root/.smbcredentials

echo ""
echo "##################################################################################"
echo "Add the following mount command to /etc/fstab"
echo "//192.168.0.20/share /media/samba_share cifs vers=3.0,credentials=/root/.smbcredentials,nofail"
echo "##################################################################################"
echo " Run 'sudo findmnt --verify' or 'sudo findmnt --verify --verbose' to check fstab validity"
