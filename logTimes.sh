#!/bin/bash

echo -e "\nSystem Load Analysis:"

# Loop through system activity logs and display high load instances
for log in /var/log/sa/sa[0-9]*; do
  echo "Log File: $log"
  sar -q -f "$log" | egrep -v "Average|ldavg" | awk '{if ($5 >= 1) print $1, $2, $5}'
  echo ""
done | less
