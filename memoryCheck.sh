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
