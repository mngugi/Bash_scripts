#!/bin/bash

# Function to clean memory cache

echo "====================================="
echo "      Clean Memory Cache     "
echo "====================================="
clean_memory_cache() {
    echo "Cleaning memory cache..."
    sync; echo 3 > /proc/sys/vm/drop_caches
    echo "Memory cache cleaned."
}

# Function to remove retired updates and upgrades
remove_retired_updates() {
    echo "Removing retired updates and upgrades..."
    removed_updates=$(sudo dnf autoremove -y | grep "Removed")
    if [ -n "$removed_updates" ]; then
        echo "Retired updates and upgrades removed:"
        echo "$removed_updates"
    else
        echo "No retired updates or upgrades found."
    fi
}

# Clean memory cache
clean_memory_cache

# Remove retired updates and upgrades
remove_retired_updates

echo "Cleanup completed."
