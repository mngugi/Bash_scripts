#!/bin/bash

# Bash script to verify Fedora ISO download using GPG and SHA256 checksums

set -e

# --- CONFIGURATION ---
CHECKSUM_FILE="Fedora-Labs-42-1.1-x86_64-CHECKSUM"
ISO_FILE="Fedora-Labs-42-1.1-x86_64.iso"  # Replace with your actual ISO filename
GPG_KEY_URL="https://fedoraproject.org/fedora.gpg"
GPG_KEY_FILE="fedora.gpg"
# ----------------------

echo "🔐 Step 1: Downloading Fedora GPG key..."
curl -fsSLo "$GPG_KEY_FILE" "$GPG_KEY_URL"
echo "✅ GPG key downloaded as $GPG_KEY_FILE"

echo "🧾 Step 2: Verifying the checksum file with the GPG key..."
gpgv --keyring "./$GPG_KEY_FILE" "$CHECKSUM_FILE"

echo "📦 Step 3: Verifying the ISO checksum..."
sha256sum -c "$CHECKSUM_FILE" | grep "$ISO_FILE"

echo "✅ All checks passed. Your Fedora image is authentic and uncorrupted."
