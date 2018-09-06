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
src_file="Src/init.c"
bin_file="Run/init"

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

last_mod() {
    if [ -f $1 ]
    then
	stat -c "%Y" $1
    fi
}

# Check last modifed date
last_mod_src=$(last_mod $src_file)
last_mod_bin=$(last_mod $bin_file)

# Launch the shell
if [[ -f Run/init && $last_mod_bin -ge $last_mod_src ]]
then
    s_echo "Binary found. Executing"
    launch_shell
else
    if [ $silent ]
    then
	exec > /dev/null
    fi
    s_echo "Binary not found or out of date. Compiling..."
    make 
    if [ $silent ]
    then
	exec
    fi
    launch_shell
fi
