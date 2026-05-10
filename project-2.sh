#!/bin/bash

#################
#
# Author: Abhishek
#
# Date: 10-05-2026
#
# This script checks the disk usage and gives alert if it's above threshold limit
#
# Version: v1
#
#################

echo "Check the disk usage in /dev/root "

disk_size=`df -h | grep /dev/root | awk '{print $5}' | cut -d '%' -f1`

if [[ $disk_size -gt 00 ]];
        then
                echo "$disk_size% space has been occupied, take action!"

else
        echo "disk size is under limit: $disk_size"
	
fi
