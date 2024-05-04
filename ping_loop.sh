#!/bin/bash 

for ip in $(seq 20 32); do
ping -c 1 192.168.100.$ip
done


