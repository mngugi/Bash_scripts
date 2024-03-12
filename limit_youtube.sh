#!/bin/bash

# Find PID for PipeWire
pipewire_pid=$(pgrep -x pipewire)
# Find PID for WirePlumber
wireplumber_pid=$(pgrep -x wireplumber)

# Limit CPU usage for PipeWire
cpulimit -p $pipewire_pid -l 50 &
# Limit CPU usage for WirePlumber
cpulimit -p $wireplumber_pid -l 50 &

echo "CPU limits set for PipeWire (PID: $pipewire_pid) and WirePlumber (PID: $wireplumber_pid)"

