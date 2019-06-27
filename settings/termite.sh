#!/usr/bin/env sh

#COLOR-SCRIPT
white="\033[1;37m"
whitebg="\033[07;37m"
grey="\033[0;37m"
purple="\033[0;35m"
red="\033[2;31m"
redbg="\033[07;31m"
green="\033[2;32m"
yellow="\033[1;33m"
Purple="\033[0;35m"
Cyan="\033[0;36m"
Cafe="\033[0;33m"
Fiuscha="\033[0;35m"
blue="\033[01;34m"
nc="\e[0m"
mon="mon"

#STARTING-SCRIPT
reset
echo ""
echo "$green ████████╗███████╗██████╗ ███╗   ███╗██╗████████╗███████╗
 ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║╚══██╔══╝██╔════╝
    ██║   █████╗  ██████╔╝██╔████╔██║██║   ██║   █████╗  
    ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║   ██║   ██╔══╝  
    ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║   ██║   ███████╗
    ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝   ╚═╝   ╚══════╝$nc"
echo "$Cafe Termite for$yellow Debian/Ubuntu | Termite based on$blue Archlinux $nc"
echo "$Cyan -------------------------------------------------------"
echo "$Cafe > Do you want to install Now ?"
echo "  [1] Yes"
echo "  [2] No"
echo "  [3] Abort it"
echo "  ---"
echo "$grey  [X] About $nc $Cyan"
read -p "[termite@debian]:# " termite;

if [ $termite = 1 ]
then
echo "----------------------------------------"
echo "> Please wait to starting install ..."
sleep 3
echo ""
sudo apt-get update
sudo apt-get install -y \
	git \
	g++ \
	libgtk-3-dev \
	gtk-doc-tools \
	gnutls-bin \
	valac \
	intltool \
	libpcre2-dev \
	libglib3.0-cil-dev \
	libgnutls28-dev \
	libgirepository1.0-dev \
	libxml2-utils \
	gperf
	
git clone --recursive https://github.com/thestinger/termite.git
git clone https://github.com/thestinger/vte-ng.git

echo export LIBRARY_PATH="/usr/include/gtk-3.0:$LIBRARY_PATH"
cd vte-ng && ./autogen.sh && make && sudo make install
cd ../termite && make && sudo make install
sudo ldconfig
sudo mkdir -p /lib/terminfo/x; sudo ln -s \
/usr/local/share/terminfo/x/xterm-termite \
/lib/terminfo/x/xterm-termite

sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/termite 60
echo ""
clear
echo ""
echo "> Press ENTER to try Your Termite .."
read
/usr/bin/termite
fi

if [ $termite = 2 ]
then
	echo "----------------------------------"
	echo "> Oke,Good bye !!"
sleep 3
reset
fi

if [ $termite = 3 ]
then
	sleep 2
killall x-terminal-emulator
killall bash
fi

if [ $termite = X ] || [ $termite = x ]
then
	reset
	echo "══════════════════════════════════════════╗"
	echo "> Contact me :"
	echo "  - Facebook : facebook.com/adi.wj0"
	echo "  - Gmail  : adiwijaya989898@gmail.com"
	echo "  - GitHub : github.com/PkuLNX"
	echo "══════════════════════════════════════════╝"
echo ""
sleep 3
echo "   Press 'ENTER' to Back to mainmenu"
read enter
./termite.sh
fi


