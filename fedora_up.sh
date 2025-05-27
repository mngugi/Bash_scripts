#!/usr/bin/env bash
# fedora_upgrade_tool.sh
# A robust Fedora upgrade script for Fedora 42 using dnf5 and system-upgrade plugin

set -euo pipefail
IFS=$'\n\t'

LOGFILE="/var/log/fedora_upgrade_tool.log"
exec > >(tee -a "$LOGFILE") 2>&1

echo "🚀 Starting Fedora Upgrade to 42"

echo "📦 Ensuring system-upgrade plugin is installed..."
dnf5 install -y dnf-plugins-core || {
  echo "❌ Failed to install system-upgrade plugin"
  exit 1
}

echo "🧹 Cleaning cache..."
dnf5 clean all || {
  echo "❌ Clean failed"
  exit 1
}

echo "🔄 Enabling system-upgrade and syncing metadata..."
dnf5 system-upgrade download --releasever=42 --allowerasing --noclearchannels || {
  echo "❌ Download step failed"
  exit 1
}

echo "⬇ Resolving and downloading upgrade packages..."
# Note: --skip-broken not supported in download, but can be used in upgrade if needed

# If you want to tolerate broken deps at install stage, use upgrade with skip-broken
# dnf5 system-upgrade download --releasever=42 --allowerasing --skip-broken


echo "✅ Packages downloaded successfully"

echo "🔁 Starting system-upgrade reboot..."

dnf5 system-upgrade reboot
