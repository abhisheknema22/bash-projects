#!/bin/bash

echo "This script deletes files older than 30 days in path, where path will be provided as positional arguments"

path=$1
echo "Path is: $path"

find $path -mtime +30

if [[ $? -eq 0 ]];
then
	echo "Deleting the files older than 30 days"
	find $path -mtime +30 -delete

else
	echo "Not able to delete :\ , something wrong"

fi
