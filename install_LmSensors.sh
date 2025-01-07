#!/bin/bash 
echo "====================================="
echo "     Install LM Sensors"
echo "====================================="

sudo dnf install lm_sensors
sudo dnf search lm_sensors
sudo dnf install sensors
sudo dnf repolist
sudo dnf install epel-release
sensors



