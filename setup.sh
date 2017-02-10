#!/bin/bash

# Universal Linux Setup Script

LVER=$(cat /proc/version)

case "$LVER" in

*Ubuntu*)
PKMGR="apt-get"
;;
*Redhat*)
PKMGR="yum"
;;
esac
echo $PKMGR

$PKMGR update -y

$PKMGR install libfuse-dev open-vm-tools open-vm-tools-desktop

