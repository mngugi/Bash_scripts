#!/usr/bin/env bash
# fedora_update_tool.sh
# A robust Fedora update script for day-to-day upgrades (not version upgrades)

set -euo pipefail
IFS=$'\n\t'

LOGFILE="/var/log/fedora_update_tool.log"
exec > >(tee -a "$LOGFILE") 2>&1

echo "🔧 Fedora Update Script Starting..."
echo "📅 Date: $(date)"
echo "🖥️  Hostname: $(hostname)"
echo "📦 Fedora Version: $(rpm -E %fedora)"

echo "📦 Ensuring essential DNF plugins are installed..."
dnf install -y dnf-plugins-core || {
  echo "❌ Failed to install dnf-plugins-core"
  exit 1
}

echo "🧹 Cleaning cache..."
dnf clean all || {
  echo "❌ Failed to clean DNF cache"
  exit 1
}

echo "🔄 Refreshing repositories and upgrading packages..."
dnf upgrade --refresh -y || {
  echo "❌ System update failed"
  exit 1
}

echo "✅ System updated successfully!"

# Optional: reboot prompt
read -rp "🔁 Reboot now? (y/n): " choice
if [[ "$choice" =~ ^[Yy]$ ]]; then
  echo "🔄 Rebooting..."
  reboot
else
  echo "✅ Update complete. Reboot deferred."
fi
