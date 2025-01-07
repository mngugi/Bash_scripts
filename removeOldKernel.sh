#!/bin/bash

# Script to remove old kernels on Ubuntu/Debian or Fedora-based systems

# Detect the current distribution
echo "====================================="
echo "     Remove Old Kernels Debian"
echo "====================================="
if [ -f /etc/debian_version ]; then
    echo "Detected Debian/Ubuntu-based system."
    echo "Removing old kernels except for the currently running one..."
    sudo apt-get autoremove --purge -y
elif [ -f /etc/fedora-release ] || [ -f /etc/redhat-release ]; then
    echo "Detected Fedora/RedHat-based system."
    echo "Removing old kernels except for the latest two..."
    sudo dnf remove $(dnf repoquery --installonly --latest-limit=2 -q) -y
else
    echo "Unsupported distribution. Exiting."
    exit 1
fi

