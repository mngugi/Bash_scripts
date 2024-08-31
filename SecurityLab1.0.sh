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

# Install packages
install_package etherape "Graphical network monitor"
install_package ettercap "Suite for man-in-the-middle attacks"
install_package wireshark "Network traffic analyzer"
install_package medusa "Massively parallel, modular login brute-forcer"
install_package nmap "Network discovery and security auditing tool"
install_package scap-workbench "SCAP scanner with GUI and tailoring capabilities"
install_package skipfish "Active web application security reconnaissance tool"
install_package sqlninja "Tool to test SQL Injection vulnerabilities"
install_package yersinia "Tool to exploit weaknesses in network protocols"
install_package hydra "Powerful login cracker supporting numerous protocols"
install_package aircrack-ng "Wireless network security toolset"
install_package john "Fast password cracker"
install_package nikto "Web server scanner"
install_package metasploit "Penetration testing framework"
install_package ncrack "Network authentication cracker"
install_package burpsuite "Advanced web vulnerability scanning tool"
install_package hashcat "GPU-based password cracking tool"
install_package lynis "Security auditing tool for Unix/Linux systems"
install_package tcpdump "Network packet analyzer"
install_package gobuster "Directory, file, and DNS subdomain brute-forcer"
install_package openvas "Full-featured vulnerability scanner"

# Post-installation configuration
echo "Configuring Wireshark..."
if usermod -aG wireshark "$SUDO_USER"; then
  echo "Wireshark configured successfully. Please log out and log back in for group changes to take effect."
else
  echo "Failed to configure Wireshark. Please check $LOGFILE for details."
  echo "Error configuring Wireshark" >> "$LOGFILE"
fi

# Initialize Metasploit database
echo "Initializing Metasploit database..."
if msfdb init; then
  echo "Metasploit database initialized successfully."
else
  echo "Failed to initialize Metasploit database. Check $LOGFILE for details."
  echo "Error initializing Metasploit database" >> "$LOGFILE"
fi

echo "All installations and configurations are complete. Please check $LOGFILE for any errors."

