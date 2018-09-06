#!/bin/bash
while getopts ":s" opt
do
    case $opt in
	s)
	    silent=true
	    ;;
    esac
done

# Functions
s_echo() {
    if [ ! $silent ]
    then
	echo "$@"
    fi
}
