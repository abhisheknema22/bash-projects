#!/bin/bash

echo "This script list top 10 files by size as per path, where path will be provided as positional arguments"

path=$1

echo "path is: $path"

du -ah | sort -hr | head -n 5 > /tmp/filesize.txt

cat /tmp/filesize.txt

