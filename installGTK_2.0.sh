#!/bin/bash
# Author : Peter Mwangi Ngugi

echo "====================================="
echo "     Install GTK3"
echo "====================================="



sudo dnf install gtk3-devel gstreamer1-devel clutter-devel webkit2gtk3-devel libgda-devel gobject-introspection-devel
sudo dnf install devhelp gtk3-devel-docs clutter-doc | zenity 
-- progress
