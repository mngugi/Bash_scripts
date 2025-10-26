#!/bin/bash
echo "1. Get Disk Serial Number "

sudo udevadm info --query=all --name=/dev/sdc | grep SERIAL

echo "2. Get Mount Time Directly (from ext filesystems) "

sudo debugfs -R "stat <2>" /dev/sdb2 | grep 'crtime'

echo "3. Log USB Insertions "
grep "usb" /var/log/syslog | grep "sdc"

echo "4. Enhanced extraction  "
udevadm info --query=all --name=/dev/sdc1 | grep -E "SERIAL|ID_MODEL"

