#!/bin/bash

set -e

# Fedora 42 Upgrade Script with Error Recovery

echo "🚀 Starting Fedora 42 upgrade..."

# Step 1: Clean up the system
echo "🧹 Cleaning up the system..."
sudo dnf remove --duplicates -y || true
sudo dnf autoremove -y || true
sudo dnf clean all
sudo rpm --rebuilddb

# Step 2: Enable all required Fedora 42 repos
echo "📦 Enabling Fedora 42 repositories..."
sudo dnf config-manager --set-enabled fedora || true
sudo dnf config-manager --set-enabled updates || true
sudo dnf config-manager --set-enabled updates-testing || true

# Step 3: Sync to Fedora 42 packages, allowing erasing for broken ones
echo "🔄 Syncing system packages with Fedora 42..."
sudo dnf --releasever=42 --setopt=deltarpm=false --allowerasing distro-sync -y || true

# Step 4: Attempt download of upgrade packages, skipping broken ones
echo "⬇️ Downloading Fedora 42 upgrade packages..."
sudo dnf system-upgrade download --releasever=42 --allowerasing --skip-broken --best -y || {
  echo "⚠️ Download failed. Attempting manual conflict resolution..."

  # Known conflicting packages — remove them one by one if needed
  sudo dnf remove -y catdoc-wordview || true
  sudo dnf remove -y emacsclient || true
  sudo dnf remove -y gdk-pixbuf2-modules-extra || true
  sudo dnf remove -y google-noto-sans-meetei-mayek-vf-fonts || true
  sudo dnf remove -y ibus-xinit || true
  sudo dnf remove -y libblockdev-smart || true
  sudo dnf remove -y libdnf5-plugin-expired-pgp-keys || true
  sudo dnf remove -y libtinysparql || true
  sudo dnf remove -y localsearch || true
  sudo dnf remove -y proj-data-cz || true
  sudo dnf remove -y python3-crypt-r || true
  sudo dnf remove -y tesseract-libs || true
  sudo dnf remove -y valgrind-gdb || true
  sudo dnf remove -y google-noto-fonts-common || true
  sudo dnf remove -y libarrow || true
  sudo dnf remove -y libavfilter-free || true
  sudo dnf remove -y libicu || true
  sudo dnf remove -y ima-evm-utils-libs || true
  sudo dnf remove -y cdi-api || true
  sudo dnf remove -y proj-data-lv || true
  sudo dnf remove -y R-core || true

  echo "🔁 Retrying download..."
  sudo dnf system-upgrade download --releasever=42 --allowerasing --skip-broken --best -y
}

# Step 5: Reboot to complete upgrade
echo "🔁 Rebooting to complete Fedora 42 upgrade..."
sudo dnf system-upgrade reboot
