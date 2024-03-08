#!/bin/bash

source=$1
dest=$2

#create archive filename with day of the week and hostname
day=$(date +%A)
hostname=$(hostname -s)
archive_file="$day-$hostname.tgz"

if [[ -z $source ]] || [[ -z $dest ]]; then

echo "you need to provide source and destination directory"
exit 1
elif [[ ! -d $source ]] || [[ ! -d $dest ]]; then 

echo "both argumnet needs to be a directory directory"
exit 1
else  

#backup the files
echo "backing up $source to $dest....."

tar czf "$dest/$archive_file" "$source"

echo "succesfully backup file"
echo "$(date)"

fi

