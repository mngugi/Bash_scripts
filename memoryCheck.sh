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

echo -e "\nSystem Load Analysis:"

# Loop through system activity logs and display high load instances
for log in /var/log/sa/sa[0-9]*; do
  echo "Log File: $log"
  sar -q -f "$log" | egrep -v "Average|ldavg" | awk '{if ($5 >= 1) print $1, $2, $5}'
  echo ""
done | less

