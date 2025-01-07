#!/bin/bash

# Update package lists and upgrade installed packages
echo "====================================="
echo "     Update Fedora Tool"
echo "====================================="
sudo dnf update
sudo dnf upgrade

# Refresh package cache and update again
sudo dnf --refresh update 

# Install necessary packages for system upgrade
sudo dnf install dnf-plugin-system-upgrade
sudo dnf install rpmconf

# Detect and merge configuration files for updated packages
sudo rpmconf -a

# Download Fedora 39 release files
sudo dnf system-upgrade download --releasever=40

# Install tool for removing retired packages
sudo dnf install remove-retired-packages
remove-retired-packages

# Check for unsatisfied dependencies and remove duplicate packages
sudo dnf repoquery --unsatisfied
sudo dnf remove --duplicates

# List and remove extra packages (excluding kernel)
sudo dnf list extras
sudo dnf remove $(sudo dnf repoquery --extras --exclude=kernel,kernel-\*)
sudo dnf autoremove

# Remove old kernels
old_kernels=($(dnf repoquery --installonly --latest-limit=-1 -q))
if [ "${#old_kernels[@]}" -eq 0 ]; then
    echo "No old kernels found"
else
    if ! sudo dnf remove "${old_kernels[@]}"; then
        echo "Failed to remove old kernels"
        exit 1
    else
        echo "Removed old kernels"
    fi
fi

# Install symlinks and remove dangling ones
sudo dnf install symlinks
sudo symlinks -r /usr | grep dangling
sudo symlinks -r -d /usr

# Remove rescue kernel images and perform kernel-related tasks
sudo rm /boot/*rescue*
sudo kernel-install add "$(uname -r)" "/lib/modules/$(uname -r)/vmlinuz"
sudo dnf install dracut-config-rescue

# Rebuild rpm database and synchronize distribution packages
sudo rpm --rebuilddb
sudo dnf distro-sync
sudo dnf distro-sync --allowerasing

# Set SELinux context on boot
sudo fixfiles -B onboot

sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql

# Reboot the system for the upgrade to take effect
sudo dnf system-upgrade reboot
