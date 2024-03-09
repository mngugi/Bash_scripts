#!/bin/bash

# Check if running as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root. Use 'sudo ./setup_utilities.sh'"
    exit 1
fi

# Update package list and install required tools
dnf update
dnf install -y nmap netcat wireshark

# Check if installation was successful
if [ $? -eq 0 ]; then
    echo "Installation successful."
else
    echo "Error: Installation failed."
    exit 1
fi

# Add user to wireshark group to run without sudo
usermod -aG wireshark $USER

echo "Setup completed. You may need to log out and log back in for changes to take effect."

