#!/usr/bin/env bash
# fedora_upgrade_tool.sh
# A robust Fedora upgrade script for Fedora 42 using legacy dnf + system-upgrade plugin

set -euo pipefail
IFS=$'\n\t'

LOGFILE="/var/log/fedora_upgrade_tool.log"
exec > >(tee -a "$LOGFILE") 2>&1

echo "🚀 Starting Fedora Upgrade to 42"

echo "📦 Ensuring system-upgrade plugin is installed..."
dnf install -y dnf-plugin-system-upgrade || {
  echo "❌ Failed to install system-upgrade plugin"
  exit 1
}

echo "🧹 Cleaning cache..."
dnf clean all || {
  echo "❌ Clean failed"
  exit 1
}

echo "🔄 Downloading upgrade packages for Fedora 42..."
dnf system-upgrade download --releasever=42 --allowerasing || {
  echo "❌ Download step failed"
  exit 1
}

CURRENT_VER=$(rpm -E %fedora)
TARGET_VER=42

if [[ "$TARGET_VER" -le "$CURRENT_VER" ]]; then
  echo "⚠️  Current Fedora version is $CURRENT_VER. Cannot upgrade to same or lower version ($TARGET_VER)."
  exit 1
fi


echo "✅ Packages downloaded successfully"

echo "🔁 Rebooting to apply upgrade..."
dnf system-upgrade reboot
