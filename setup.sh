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

$PKMGR update -y

$PKMGR install libfuse-dev open-vm-tools open-vm-tools-desktop git -y

git clone https://github.com/KittyKatt/screenFetch.git
cd screenFetch
chmod +x screenfetch-dev
mv screenfetch-dev /etc/screenfetch

if $DISTRO = "U"
then
	$PKMGR install openssh-server sudo -y
	echo  screenfetch >> /etc/bash.bashrc
	echo "$USER	ALL=(ALL:ALL) ALL" >> /etc/sudoers

elif $DISTRO ="R"
	echo screenfetch >> /etc/bashrc
then
fi




