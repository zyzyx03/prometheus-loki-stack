#!/usr/bin/env bash

file=$1

icmptest() {
    for TARGET in $(cat $file)
        do ping -w 1 -c 1 $TARGET > /dev/null 2>&1
            if [ $? -eq 0 ]
                then 
                    echo  -e "\e[1;32m ${TARGET} Reachable \e[0m"
                else
                    echo -e "\e[1;31m ${TARGET} Unreachable \e[0m"
            fi
    done
}


if [ $# -eq 0 ]
    then 
        echo 'Please supply input file'
        exit 1
    else
        icmptest
fi