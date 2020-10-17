#!/bin/bash
# find memory usage of all tasks in the system and sort

GetVmRss()
{
        for file in $(ls /proc/*/status)
        do
                if [ -f $file ]; then
                        result=$(cat $file | grep VmRSS)
                        if [ -n "$result" ]; then
                                echo $file $result
                        fi
                fi
        done
}

GetVmRss | sort -t ' ' -k 3 -r -n