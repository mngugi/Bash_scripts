#!/usr/bin/env bash

set -euo pipefail

LOG_FILE="/var/log/fedora-upgrade.log"

echo "[+] Starting Fedora upgrade process..." | tee -a $LOG_FILE

# Step 0: Check root
if [[ $EUID -ne 0 ]]; then
    echo "[!] Run as root (sudo)" | tee -a $LOG_FILE
    exit 1
fi

# Step 1: Pre-checks
echo "[+] Checking disk space..." | tee -a $LOG_FILE
df -h / | tee -a $LOG_FILE

echo "[+] Checking internet connectivity..." | tee -a $LOG_FILE
ping -c 3 8.8.8.8 || { echo "[!] No internet"; exit 1; }

# Step 2: Update system
echo "[+] Updating system..." | tee -a $LOG_FILE
dnf upgrade --refresh -y | tee -a $LOG_FILE

# Step 3: Install plugin
echo "[+] Installing upgrade plugin..." | tee -a $LOG_FILE
dnf install dnf-plugin-system-upgrade -y | tee -a $LOG_FILE

# Step 4: Disable problematic repos (optional safety)
echo "[+] Disabling third-party repos..." | tee -a $LOG_FILE
dnf config-manager --set-disabled \*rpmfusion\* || true

# Step 5: Download upgrade
echo "[+] Downloading Fedora 44 packages..." | tee -a $LOG_FILE
dnf system-upgrade download --releasever=44 --allowerasing | tee -a $LOG_FILE

# Step 6: Upgrade
echo "[+] Rebooting into upgrade..." | tee -a $LOG_FILE
dnf system-upgrade reboot
