#!/bin/bash

LOGFILE="/var/log/fedora-up42.log"
RELEASEVER=42

log() {
  echo -e "[$(date '+%F %T')] $1" | tee -a "$LOGFILE"
}

abort() {
  log "❌ $1"
  exit 1
}

log "🚀 Fedora Upgrade to $RELEASEVER Starting"

# Pre-check
if ! command -v dnf > /dev/null; then
  abort "DNF not found. Are you running Fedora?"
fi

if ! rpm -q dnf-plugin-system-upgrade > /dev/null; then
  log "📦 Installing system-upgrade plugin"
  sudo dnf install -y dnf-plugin-system-upgrade || abort "Plugin install failed"
fi

log "🧹 Cleaning system"
sudo dnf clean all && sudo dnf autoremove -y

log "🔄 Syncing system"
sudo dnf --releasever=$RELEASEVER --allowerasing distro-sync -y || log "⚠️ Sync failed — continuing"

log "⬇️ Downloading upgrade packages"
sudo dnf system-upgrade download --releasever=$RELEASEVER --allowerasing --skip-broken --best -y || abort "Download failed"

# Optional firmware check
FW_PATH="/lib/firmware/brcm/BCM20702A1-0a5c-21e6.hcd"
if [ ! -f "$FW_PATH" ]; then
  log "⚠️ Missing Broadcom Bluetooth firmware: $FW_PATH"
fi

if [ -f /var/lib/dnf/system-upgrade/system-upgrade-transaction.json ]; then
  log "✅ Download successful. Ready to reboot."
  read -rp "Reboot now to apply upgrade? [Y/n]: " answer
  if [[ $answer =~ ^[Yy]$ || -z $answer ]]; then
    sudo dnf system-upgrade reboot
  else
    log "❗ Upgrade staged, reboot later using: sudo dnf system-upgrade reboot"
  fi
else
  abort "Upgrade transaction not found."
fi
