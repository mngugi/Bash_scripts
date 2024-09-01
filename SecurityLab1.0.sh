#!/bin/bash

# Author: Peter Mwangi Ngugi
# This is a bash script program to install a Security lab on Fedora OS

# Ensure script is run with superuser privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root or use sudo to execute this script."
  exit 1
fi

# Update system packages
echo "Updating system..."
dnf update -y

# Log file for recording errors
LOGFILE="install_log.txt"
echo "Starting installation..." > "$LOGFILE"

# Function to install a package
install_package() {
  local package=$1
  local description=$2
  echo "Installing $package: $description"
  if dnf install -y "$package"; then
    echo "$package installed successfully."
  else
    echo "Error installing $package. Check $LOGFILE for details."
    echo "Error installing $package" >> "$LOGFILE"
  fi
}

# Install general tools
install_package etherape "Graphical network monitor"
install_package ettercap "Suite for man-in-the-middle attacks"
install_package wireshark "Network traffic analyzer"
install_package medusa "Massively parallel, modular login brute-forcer"
install_package nmap "Network discovery and security auditing tool"
install_package scap-workbench "SCAP scanner with GUI and tailoring capabilities"
install_package sqlninja "Tool to test SQL Injection vulnerabilities"
install_package yersinia "Tool to exploit weaknesses in network protocols"
install_package hydra "Powerful login cracker supporting numerous protocols"
install_package aircrack-ng "Wireless network security toolset"
install_package john "Fast password cracker"
install_package nikto "Web server scanner"
install_package ncrack "Network authentication cracker"
install_package lynis "Security auditing tool for Unix/Linux systems"
install_package tcpdump "Network packet analyzer"

# Configure Wireshark
echo "Configuring Wireshark..."
if usermod -aG wireshark "$SUDO_USER"; then
  echo "Wireshark configured successfully. Please log out and log back in for group changes to take effect."
else
  echo "Failed to configure Wireshark. Please check $LOGFILE for details."
  echo "Error configuring Wireshark" >> "$LOGFILE"
fi

# Install Skipfish from source
echo "Installing Skipfish..."
sudo dnf install git gcc make zlib-devel libidn-devel openssl-devel libpcre2-devel -y
git clone https://github.com/spinkham/skipfish.git
cd skipfish
make
sudo cp skipfish /usr/local/bin/
cd ..

# Install Metasploit Framework from official installer
echo "Installing Metasploit Framework..."
curl https://raw.githubusercontent.com/rapid7/metasploit-framework/master/msfinstall > msfinstall
chmod 755 msfinstall
sudo ./msfinstall

# Install Burp Suite (Community Edition)
echo "Installing Burp Suite..."
wget https://portswigger.net/burp/releases/download?product=community&version=2023.8&type=jar -O burpsuite_community.jar

# Install OpenVAS via Greenbone Vulnerability Manager (GVM)
echo "Installing OpenVAS..."
sudo dnf install dnf-plugins-core -y
sudo dnf copr enable @greenbone/gvm-latest -y
install_package greenbone-vulnerability-manager "Full-featured vulnerability scanner"
sudo gvm-setup
sudo gvm-start

# Install additional tools
install_package hashcat "GPU-based password cracking tool"
install_package gobuster "Directory, file, and DNS subdomain brute-forcer"

# Configure PostgreSQL for Metasploit
echo "Installing and configuring PostgreSQL for Metasploit..."
sudo dnf install postgresql-server postgresql-contrib -y
sudo postgresql-setup --initdb
sudo systemctl start postgresql
sudo systemctl enable postgresql
sudo -i -u postgres psql -c "CREATE USER msf WITH PASSWORD 'your_secure_password';"
sudo -i -u postgres psql -c "CREATE DATABASE msf_database OWNER msf;"
sudo -i -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE msf_database TO msf;"

# Initialize Metasploit Database
echo "Initializing Metasploit database..."
if msfdb init; then
  echo "Metasploit database initialized successfully."
else
  echo "Error initializing Metasploit database. Check $LOGFILE for details."
  echo "Error initializing Metasploit database" >> "$LOGFILE"
fi

echo "All installations and configurations are complete. Please check $LOGFILE for any errors."
