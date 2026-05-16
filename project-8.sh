#!/bin/bash

# Task-1
# This script checks if docker is installed or not in the system.
# if it's installed then check the status, otherwise install it
#
# Task-2
# Check if docker is running or not
# if it's running then just inform
# if it's not running then start it using cron job after every 1 min.


echo "------Starting program------" 
echo "date: $(date)"
result=$(which docker)
# echo "value of result is $result"

if [[ "$result" == "" ]];
then
	echo "Docker is not installed"

	echo "Updating packages and Installing docker"
	sudo apt update && sudo apt install docker.io

	echo "Relaoding deamon, may take 30 sec."
        sudo systemctl daemon-reload
        sleep 30

	
	echo "Fixing docker sockets and starting docker, 30 sec"
	sudo systemctl start docker.socket 
	sleep 30
	sudo systemctl start docker

	echo "$(systemctl status docker)"

else
	echo "Docker is installed in system"
	echo "Docker: $result"

	echo "Checking running status of docker..."

	docker_status=`systemctl status docker | awk 'NR==3 {print}' | cut -d ':' -f 2 | cut -d '(' -f 1 | xargs`

	echo "Status of docker: $docker_status"

	if [[ "$docker_status" == "active" ]];
	then
		echo "Docker is runnning fine..."

	else
		echo "Docker not running..."
		echo "Reloloading the deamon first, it may take 30 seconds"
		sudo systemctl daemon-reload
		sleep 30

		echo "Starting the docker socket, 30 sec."
		sudo systemctl start docker.socket
		sleep 30
		sudo systemctl start docker
	fi
	
	echo "Docker is $(systemctl is-active docker) now"

fi

echo "------Program ended!------" 
