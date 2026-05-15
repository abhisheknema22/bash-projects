#!/bin/bash

# This script checks the status of Docker if it's running or not

echo "Checking status of Docker service"

status="`systemctl status docker | awk 'NR==3{print}' | cut -d ':' -f 2 | cut -d '(' -f 1`"

if [[ $status -eq "active" ]];
then
	echo "Docker is running..."

else
	echo "Docker not running"

fi
