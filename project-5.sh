#!/bin/bash

echo "This script checks if Prometheus exist in path filesystem, if not then it downloads it"

path=$1
echo "Path is $path"

if [[ -e $path/prometheus-3.11.3.darwin-amd64.tar.gz ]];
then
	echo "prometheus already exist, no need to download"
	tar -xzvf prometheus-3.11.3.darwin-amd64.tar.gz 
	echo "Prometheus extracted in $path"

else
	echo "Downloading prometheus"
	wget -P /home/abhishek/temporary_files https://github.com/prometheus/prometheus/releases/download/v3.11.3/prometheus-3.11.3.darwin-amd64.tar.gz
	
fi
