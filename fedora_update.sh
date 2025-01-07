
#!/bin/bash
# Author: Peter Mwangi Ngugi
# Fedora daily updates on terminal
# Update package lists

echo "====================================="
echo "     Update && Upgrade Fedora OS"
echo "====================================="

sudo dnf update

# Upgrade installed packages
# Reboots the computer after installations

sudo dnf upgrade
sudo reboot
