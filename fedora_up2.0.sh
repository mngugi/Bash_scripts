#!/usr/bin/env bash
# fedora_upgrade_tool2.0.sh
# A robust Fedora upgrade script using dnf and system-upgrade

set -euo pipefail
IFS=$'\n\t'

TARGET_VER=42
CURRENT_VER=$(rpm -E %fedora)
LOGFILE="/var/log/fedora_upgrade_tool.log"
exec > >(tee -a "$LOGFILE") 2>&1

echo "🚀 Starting Fedora Upgrade to $TARGET_VER"

if [[ "$TARGET_VER" -le "$CURRENT_VER" ]]; then
  echo "⚠️  You are already running Fedora $CURRENT_VER. No upgrade needed."
  exit 0
fi

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

echo "🔄 Downloading upgrade packages for Fedora $TARGET_VER..."
dnf system-upgrade download --releasever="$TARGET_VER" --allowerasing || {
  echo "❌ Download step failed"
  exit 1
}

echo "✅ Packages downloaded successfully"
echo "🔁 Rebooting to apply upgrade..."
dnf system-upgrade reboot
