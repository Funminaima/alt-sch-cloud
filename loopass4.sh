#!/bin/bash

list_all=false
top_n=8

# Parse command line options
while getopts ":d:n:" opt; do
  case $opt in
    d)
      list_all=true
      directory=$OPTARG
      ;;
    n)
      top_n=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# Shift the option parameters
shift $((OPTIND -1))

# Get the compulsory argument
directory=$1

# Check if compulsory argument is provided
if [ -z "$directory" ]; then
  echo "Usage: $0 [-d directory] [-n N] directory" >&2
  exit 1
fi

# Check if the directory exists
if [ ! -d "$directory" ]; then
  echo "Directory $directory does not exist." >&2
  exit 1
fi

# Display disk usage
echo "Disk usage in $directory:"
if $list_all ; then
  du -ah "$directory" | sort -rh | head -n "$top_n"
else
  du -h "$directory" | sort -rh | head -n "$top_n"
fi
