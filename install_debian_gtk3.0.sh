
#!/bin/bash
# Author : Peter Mwangi Ngugi
# Description : Install GTK3 development environment on Ubuntu

set -e

echo "====================================="
echo "  Installing GTK3 Development (Ubuntu)"
echo "====================================="

if [[ $EUID -ne 0 ]]; then
    echo "❌ Please run as root or with sudo"
    exit 1
fi

apt update -y

apt install -y \
    libgtk-3-dev \
    libgstreamer1.0-dev \
    libwebkit2gtk-4.1-dev \
    libgda-5.0-dev \
    gobject-introspection \
    devhelp \
    pkg-config \
    build-essential
