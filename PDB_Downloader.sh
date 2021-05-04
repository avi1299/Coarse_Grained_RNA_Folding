#!/bin/bash

# Script to download files from RCSB http file download services.
# Use the -h switch to get help on usage.

if ! command -v curl &> /dev/null
then
    echo "'curl' could not be found. You need to install 'curl' for this script to work."
    exit 1
fi

PROGNAME=$0
BASE_URL="https://files.rcsb.org/download"


if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    echo "Usage: $PROGNAME <pdb_name>"
else
	url="$BASE_URL/$1.pdb"
	mkdir $1
	out="./$1/$1.pdb"
	echo "Downloading $url to $out"
	curl -s -f $url -o $out || (echo "Failed to download $url" && rmdir $1)
	exit 1
fi

