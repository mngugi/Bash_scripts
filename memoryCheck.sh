#!/bin/bash

grep MemTotal /proc/meminfo

free -m

free -h

free -g

echo "Memory Usage."

sar -r 
echo "Login Time"
