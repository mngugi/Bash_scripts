#!/bin/bash

# Fedora Update & Upgrade Script
# This script updates and upgrades Fedora to a specified release version.

set -euo pipefail

RELEASE_VERSION=40  # Change this to your target Fedora release version

echo "====================================="
echo "         Fedora Upgrade Tool         "
echo "====================================="

# Ensure script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "❌ This script must be run as root."
   exit 1
fi

echo "🔄 Step 1: Updating current system..."
dnf update -y && dnf upgrade -y

echo "🔄 Step 2: Refreshing cache and installing upgrade tools..."
dnf --refresh update -y
dnf install -y dnf-plugin-system-upgrade rpmconf

echo "🧩 Step 3: Resolving package config conflicts..."
rpmconf -a

echo "📦 Step 4: Downloading Fedora $RELEASE_VERSION upgrade packages..."
dnf system-upgrade download --releasever=$RELEASE_VERSION --best -y || {
  echo "❌ Download failed. Try: dnf system-upgrade download --releasever=$RELEASE_VERSION --skip-broken"
  exit 1
}

echo "🧹 Step 5: Handling retired packages..."
if ! dnf install -y remove-retired-packages; then
  echo "⚠️ Could not install remove-retired-packages. Skipping retired package cleanup."
else
  remove-retired-packages --interactive
fi

echo "🔍 Step 6: Checking for unsatisfied dependencies..."
dnf repoquery --unsatisfied || true
dnf remove --duplicates -y

echo "🗑️ Step 7: Removing extras and cleaning up..."
dnf list extras || true
dnf autoremove -y

echo "🧰 Step 8: Managing old kernels..."
dnf autoremove --installonly --keep=3

echo "🔗 Step 9: Cleaning up dangling symlinks..."
dnf install -y symlinks
symlinks -r /usr | grep dangling || true
symlinks -r -d /usr

echo "📚 Step 10: Rebuilding RPM database..."
rpm --rebuilddb

echo "📦 Step 11: Synchronizing distribution packages..."
dnf distro-sync -y

echo "🔐 Step 12: Restoring SELinux contexts..."
fixfiles onboot
restorecon -Rv /

echo "🆘 Step 13: Creating kernel rescue configuration..."
dnf install -y dracut-config-rescue
rm -f /boot/*rescue*
kernel-install add "$(uname -r)" "/lib/modules/$(uname -r)/vmlinuz"

echo "🔑 Step 14: Importing required GPG keys..."
rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql

echo "🚀 Step 15: Rebooting into system upgrade..."
dnf system-upgrade reboot
