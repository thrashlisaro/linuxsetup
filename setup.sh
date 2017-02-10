#!/bin/bash

# Universal Linux Setup Script

LVER=$(cat /proc/version)

case "$LVER" in

*Ubuntu*)
PKMGR="apt-get"
DISTRO="U"
;;
*Redhat*)
PKMGR="yum"
DISTRO="R"
;;
esac
echo $PKMGR

$PKMGR update -yqq

$PKMGR install libfuse-dev open-vm-tools open-vm-tools-desktop git -yqq

git clone https://github.com/KittyKatt/screenFetch.git
cd screenFetch
chmod +x screenfetch-dev
mv screenfetch-dev /etc/screenfetch
cd ..
rm -rf screenFetch

case "$DISTRO" in
U)
	$PKMGR install openssh-server sudo -yqq
	echo  screenfetch >> /etc/bash.bashrc
	echo "$USER	ALL=(ALL:ALL) ALL" >> /etc/sudoers
;;
R)
	echo screenfetch >> /etc/bashrc
;;
esac



