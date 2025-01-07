#!/bin/bash

# Update package lists and upgrade installed packages
echo "====================================="
echo "     Update && Upgrade Debian OS"
echo "====================================="
sudo apt update
sudo apt upgrade -y

# Install necessary packages for system upgrade
sudo apt install -y dconf-editor gnome-software gnome-packagekit synaptic apt-transport-https curl

# Perform the distribution upgrade to Debian 12
sudo apt update
sudo apt full-upgrade -y

# Remove packages that are no longer required
sudo apt autoremove -y

# Reboot the system for changes to take effect
sudo reboot

