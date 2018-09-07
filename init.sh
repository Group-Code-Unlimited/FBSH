#!/bin/bash

# Exit if command returns non-zero
set -e 

# Undefined-Variables = Error
set -u 

# Define variables to Prevent Unbound Errors
start_dir=$(pwd)
src_file="Src/init.c"
bin_file="Run/init"
shell_file="Src/shell.c"
shell_file_bin="Run/shell"

# Functions

# Echo only if silent is off
s_echo() {
    if [ ! $silent ]
    then
	printf "$@"
    fi
}

launch_shell() {
    ./Run/init
}

# Get last modified date if the file exists
last_mod() {
    if [ -f $1 ]
    then
	stat -c "%Y" $1
    fi
}

show_help(){
    cat Docs/run.txt
}
silent=true
# Get options
while getopts ":hv" opt
do
    case "$opt" in
	v)
	    silent=""
	    ;;
	h)
	    printf "Below you will find some useful FBSH tips: \n\n"
	    show_help
	    exit 0;
	    ;;
	*)
	    # If an unknown arg is provided
	    echo "Unknown Argument..."
	    echo "    Arg: -$OPTARG"
	    exit -1
	    ;;
    esac
done


# Check last modifed date
last_mod_src=$(last_mod $src_file)
last_mod_bin=$(last_mod $bin_file)
last_mod_shell=$(last_mod $shell_file)
last_mod_shell_bin=$(last_mod $shell_file_bin)

# Launch the shell
if [[ ! -f Run/init || $last_mod_bin -lt $last_mod_src || $last_mod_shell_bin -lt $last_mod_shell ]]
then
    s_echo "Binary not found or out of date. Auto-Compiling...\n\n"
    if [ $silent ]
    then
	make >/dev/null 2>&1
    else
	make
    fi
fi

# Extra test to be sure
if [ -f Run/init ]
then
    s_echo "Binary found. Executing!\n\n"
    launch_shell
else
    echo "Binary NOT found. Please run $0 again."
fi
