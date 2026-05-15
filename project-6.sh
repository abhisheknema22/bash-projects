#!/bin/bash

# This script checks if folder name "test" exists in directory or not
# If it exists then it will remove it 
# if it doesn't then it will inform us

read -p "Enter which folder you want to delete: " name

for folder in $(find ~/temporary_files -type d);

do
	cd ~/temporary_files 
	echo "Searching file in: $(pwd)"


	if [ -d $name ];
	then
		echo "$name folder exists"
		rm -rf $name
		echo "removing the folder $name"
		echo "Folder removed."
		exit 0

	else
		echo "$name folder doesn't exist"
		break	
	
	fi
done

