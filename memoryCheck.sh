#!/bin/bash

grep MemTotal /proc/meminfo

free -m

free -h

free -g

echo "Memory Usage."
