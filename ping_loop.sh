#!/bin/bash 
echo "====================================="
echo "     Ping Ip"
echo "====================================="

for ip in $(seq 20 32); do
ping -c 1 192.168.100.$ip |grep "bytes from" |cut " " -f 4 |cut -d":" -f1 
done


