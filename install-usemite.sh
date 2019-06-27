#!/bin/bash
reset
echo ""
echo "> Please wait to Installing Usemite .."
sleep 2
sudo cd settings
chmod +x usemite
sudo apt-get update
clear
echo ""
echo "> Installing was Finish !!"
sleep 3
./usemite
