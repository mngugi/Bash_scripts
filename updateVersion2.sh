#!/bin/bash

# Fedora Update & Upgrade Script
# This script updates and upgrades Fedora to a new release version.

echo "====================================="
echo "         Update Fedora Tool          "
echo "====================================="

# Ensure script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Step 1: Update package lists and upgrade installed packages
sudo dnf update -y
sudo dnf upgrade -y

# Step 2: Refresh package cache and install necessary tools
sudo dnf --refresh update -y
sudo dnf install -y dnf-plugin-system-upgrade rpmconf

# Step 3: Handle configuration files for updated packages
sudo rpmconf -a

# Step 4: Prepare for system upgrade (adjust release version as needed)
RELEASE_VERSION=40
echo "Preparing for Fedora $RELEASE_VERSION upgrade..."
sudo dnf system-upgrade download --releasever=$RELEASE_VERSION --best -y || {
  echo "Failed to download upgrade files. Check for conflicts or broken packages."
  echo "Try running: sudo dnf system-upgrade download --releasever=$RELEASE_VERSION --skip-broken"
  exit 1
}

# Step 5: Install and handle retired packages
echo "Handling retired packages..."
sudo dnf install -y remove-retired-packages
sudo remove-retired-packages --interactive

# Step 6: Check and fix package dependencies
sudo dnf repoquery --unsatisfied
sudo dnf remove --duplicates -y

# Step 7: List and remove extra packages (excluding kernel)
echo "Removing extra packages..."
sudo dnf list extras
sudo dnf autoremove -y

# Step 8: Manage kernel versions (keep 3 latest kernels)
echo "Managing kernels..."
sudo dnf autoremove --installonly --keep=3

# Step 9: Install and clean up dangling symlinks
echo "Cleaning up dangling symlinks..."
sudo dnf install -y symlinks
sudo symlinks -r /usr | grep dangling
sudo symlinks -r -d /usr

# Step 10: Rebuild RPM database
echo "Rebuilding RPM database..."
sudo rpm --rebuilddb

# Step 11: Synchronize distribution packages
echo "Synchronizing distribution packages..."
sudo dnf distro-sync -y

# Step 12: Set SELinux context on boot
echo "Resetting SELinux context on boot..."
sudo fixfiles onboot
sudo restorecon -Rv /

# Step 13: Add kernel rescue configuration (optional)
echo "Adding kernel rescue configuration..."
sudo dnf install -y dracut-config-rescue
sudo rm -f /boot/*rescue*
sudo kernel-install add "$(uname -r)" "/lib/modules/$(uname -r)/vmlinuz"

# Step 14: Import necessary GPG keys (example for MySQL)
echo "Importing GPG keys..."
sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql

# Step 15: Perform the system upgrade
echo "Rebooting system for Fedora $RELEASE_VERSION upgrade..."
sudo dnf system-upgrade reboot

