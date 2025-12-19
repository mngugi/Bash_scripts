#!/bin/bash
# Author : Peter Mwangi Ngugi
# Description : Install GTK3 development environment on Ubuntu

set -e  # Exit immediately on error

echo "====================================="
echo "     Installing GTK3 on Ubuntu"
echo "====================================="

# Ensure script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "❌ Please run this script with sudo or as root."
    exit 1
fi

echo "🔄 Updating package lists..."
apt update -y

echo "📦 Installing GTK3 and related development packages..."
apt install -y \
    libgtk-3-dev \
    libgstreamer1.0-dev \
    libclutter-1.0-dev \
    libwebkit2gtk-4.0-dev \
    libgda-5.0-dev \
    gobject-introspection \
    devhelp \
    gtk-3-doc \
    clutter-doc

echo "✅ GTK3 development environment installed successfully!"
