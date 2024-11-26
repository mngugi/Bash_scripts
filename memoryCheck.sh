#!/bin/bash

grep MemTotal /proc/meminfo

free -m

free -h

free -g

echo "Memory Usage."

sar
echo "Login Time"

sar -r 

echo "Memory Infor:"
cat /proc/meminfo  

echo "How times the system loads."

for log in `ls -1 /var/log/sa/sa[0-9]*`; do echo $log; sar -q -f $log | egrep -v “Average|ldavg” | awk ‘{if ($5>=1) print $1,$2,$5}';echo""; done | less
