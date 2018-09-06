#!/bin/bash

# Get options
while getopts ":s" opt
do
    case $opt in
	s)
	    silent=true
	    ;;
    esac
done

# Functions

# Echo only if silent is off
s_echo() {
    if [ ! $silent ]
    then
	echo "$@"
    fi
}
