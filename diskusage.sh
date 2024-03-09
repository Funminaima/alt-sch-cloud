#!/bin/bash

dir=''
number=8

while getopts ":dn:" option; do
    case $option in
        d)
            dir=$OPTARG
            ;;
        n)
            number=$OPTARG
            ;;
        \?)
            echo "Usage: $0 [-d directory] [-n number]" >&2
            exit 1
            ;;
    esac
done

shift $((OPTIND - 1))

if [[ -n $1 ]]; then
    dir=$1
fi 

if [[ ! -d $dir ]]; then
    echo "$dir is not a directory"
    exit 1
fi

if [[ $number -ne 8 ]]; then

              echo "$(du -h $dir)" | sort -n -r | head -n $number
exit 0
else
 echo "Disk usage in $dir (Top $number):"
    du -ah "$dir" | sort -n -r | head -n $number
    exit 0


fi

if [[ ! -z $dir ]]; then
    du -ah "$dir" | sort -n -r | head -n $number
#echo "hello"
    exit 0
fi

if [[ ! -z $dir ]] || [[ -n $number ]]; then
    echo "Disk usage in $dir (Top $number):"
    du -ah "$dir" | sort -n -r | head -n $number
    exit 0
fi

echo "Disk usage in $dir:"
du -h "$dir"
