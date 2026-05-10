#!/bin/bash

#################
#
# Author: Abhihsk
#
# Date: 10-05-2026
#
# This script installs docker in O.S. by checking it's flavour
#
# Version: v1
#
#################

echo "script to install Docker"
echo "Installing docker.io"

if [[ "$(cat /etc/os-release | grep PRETTY_NAME=)"  == "Ubuntu 26.04 LTS" ]];
then
	echo "This is Ubuntu"
	sudo apt update && apt install docker.io -y

elif [[ "$(cat /etc/os-release | grep PRETTY_NAME=)"  == "Amazon Linux 2023.11.20260509" ]];
then
	echo "This is Amazon Linux"
	sudo dnf update && dnf install docker.io -y

else
	echo "Something went wrong!"
	echo "Not installing Docker"
fi
