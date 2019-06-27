#!/bin/bash
reset
echo ""
echo "> Please wait to Installing Usemite .."
sleep 2
sudo mv /settings/usemite /usr/bin/
sudo chmod +x /usr/bin/usemite
sudo apt-get update
clear
echo ""
echo "> Installing was Finish !!"
sleep 3
sudo /usr/bin/usemite