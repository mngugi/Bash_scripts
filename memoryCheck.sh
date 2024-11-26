#!/bin/bash

# Display total memory
grep MemTotal /proc/meminfo

# Display memory usage in different formats
free -m
free -h
free -g

echo -e "\nMemory Usage Overview:"
sar  # Basic system activity report

echo -e "\nLogin Time Information:"
sar -r  # Display memory statistics

echo -e "\nDetailed Memory Information:"
cat /proc/meminfo  



