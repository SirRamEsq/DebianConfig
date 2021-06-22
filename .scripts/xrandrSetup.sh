#!/bin/bash

#xrandr --output HDMI-0 --auto --right-of DVI-D-1
#xrandr --output DVI-D-1 --auto --left-of HDMI-0
#xrandr --output DVI-D-1 --auto --right-of HDMI-0 --primary
#xrandr --output HDMI-0 --primary --left-of DVI-D-0
#xrandr --output eDP-1 --mode 1920x1080
#xrandr --output eDP-1 --brightness 0.75

echo "How many monitors? 1 or 2?"
read monitorCount


if [ $monitorCount -eq 1 ]; then
	echo "Choose monitor"
fi
if [ $monitorCount -gt 1 ]; then
	echo "Choose first monitor in LEFT to RIGHT order"
fi
xrandr | grep " connected" | sed "s/ .*//"
read monitorOne

monitorOneName=$( xrandr | grep " connected" | sed "s/ .*//" | sed "$monitorOne!d" )
echo $monitorOneName

if [ $monitorCount -eq 1 ]; then
	rm ~/.config/xrandrSetup.sh
	echo "xrandr --output $monitorOneName --auto" >> ~/.config/xrandrSetup.sh
	rm ~/.config/i3/configFiles/monitors.conf
	echo "set \$monitorPrimary $monitorOneName" >> ~/.config/i3/configFiles/monitors.conf
fi
if [ $monitorCount -eq 2 ]; then
	echo "Choose second monitor in LEFT to RIGHT order"
	read monitorTwo
	if [ $monitorOne -eq $monitorTwo ]; then
		echo "Chose same monitor ID for both left and right, aborting"
		exit 1
	fi
	monitorTwoName=$( xrandr | grep " connected" | sed "s/ .*//" | sed "$monitorTwo!d" )
	echo $monitorTwoName

	rm ~/.config/xrandrSetup.sh
	echo "xrandr --output $monitorOneName --auto --right-of $monitorTwoName" >> ~/.config/xrandrSetup.sh
	rm ~/.config/i3/configFiles/monitors.conf
	echo "set \$monitorPrimary $monitorOneName" >> ~/.config/i3/configFiles/monitors.conf
	echo "set \$monitorSecondary $monitorTwoName" >> ~/.config/i3/configFiles/monitors.conf
fi

chmod +x ~/.config/xrandrSetup.sh
~/.config/xrandrSetup.sh

exit 0
