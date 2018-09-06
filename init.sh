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

# Variables
start_dir=$(pwd)

# Functions

# Echo only if silent is off
s_echo() {
    if [ ! $silent ]
    then
	echo "$@"
    fi
}

launch_shell() {
    ./Run/init
}

# Launch the shell
if [ -d Run ]
then
    s_echo "Binary found. Executing"
    launch_shell
else
    if [ $silent ]
    then
	exec > /dev/null
    fi
    s_echo "Binary not found. Compiling..."
    make shell
    if [ $silent ]
    then
	exec
    fi
    launch_shell
fi
