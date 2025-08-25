#!/bin/bash

#Task is monitoring the disk '/'

current_usage=$(df -Th | grep /dev/mapper/rl_vbox-root | awk '{print $6}' | sed 's/%//')

log="/var/log/test.log"

threshold=20


if [ "$current_usage" -gt "$threshold" ]; then
	echo "$(date) :Disk usage is more than $threshold % ,current usage is $current_usage % " | tee -a $log

else
	echo "$(date) : Disk is underutilised, current usage is $current_usage % " | tee -a $log
fi

