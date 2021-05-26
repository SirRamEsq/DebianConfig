#!/bin/sh

read -p "FileName? " fileName
hp-scan --size=letter -o ./$fileName.png
