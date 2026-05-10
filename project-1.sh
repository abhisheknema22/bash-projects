#!/bin/bash

#################
#
# Author: Abhihsk
#
# Date: 10-05-2026
#
# This script installs git software in O.S. by checking it's flavour
#
# Version: v1
#
#################

echo "script to install git"
echo "Installing git"

if [[ "$(cat /etc/os-release | grep PRETTY_NAME=)"  == "Ubuntu 26.04 LTS" ]];
then
	echo "This is Ubuntu"
	sudo apt update && apt install git -y

elif [[ "$(cat /etc/os-release | grep PRETTY_NAME=)"  == "Amazon Linux 2023.11.20260509" ]];
then
	echo "This is Amazon Linux"
	sudo dnf update && dnf install git -y

else
	echo "Something went wrong!"
	echo "Not installing git"
fi
