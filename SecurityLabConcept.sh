#!/bin/bash

# Author Peter Mwangi Ngugi
# this is bash script programm to install a Security
# lab on Fedora os
echo "====================================="
echo "     Install Security Fedora OS Tool"
echo "====================================="

# install EtherApe
sudo dnf install etherape #EtherApe is a graphical network monitor for UNIX modeled after etherman. It #displays network activity graphically.

# install ettercap 
sudo dnf install ettercap #Ettercap is a comprehensive suite for man in the middle attacks.

# install wireshark
# Wireshark is a network traffic analyzer for UNIX-ish operating systems.
sudo dnf install wireshark
sudo usermod -aG wireshark $USER

# install medusa
sudo dnf install medusa #Medusa is intended to be a speedy, massively parallel, modular, login brute-#forcer.

# install nmap
sudo dnf install nmap  #Nmap is a free and open source utility for network discovery and security auditing.

# install scap-workbench
sudo dnf install scap-workbench #A GUI tool that serves as an SCAP scanner and provides tailoring functionality for SCAP content.

# install skipfish
sudo dnf install skipfish # Skipfish is an active web application security reconnaissance tool.

# install sqlninja
sudo dnf install sqlninja # A tool targeted to test SQL Injection vulnerabilities on a web application using Microsoft® SQL Server as its back-end.

# install yersinia
sudo dnf install yersinia # Yersinia is a network tool designed to take advantage of some weakness in different network protocols.

# install hydra 
sudo dnf install hydra # A powerful login cracker, which supports numerous protocols.

# install aircrack-ng  
sudo dnf install aircrack-ng  #A popular wireless network security toolset

# install john        #A fast password cracker
sudo dnf install john 

# install nikto        #A web server scan
sudo dnf install nikto

# install metasploit
sudo dnf install metasploit #A comprehensive penetration testing framework.

# install ncrack 
sudo dnf install ncrack  # for network authentication cracking

# install burpsuite
sudo dnf install  burpsuite  # for advanced web vulnerability scanning

# install hashcat
sudo dnf hashcat  # for GPU-based password cracking

# install lynis
sudo dnf install lynis  #  for system auditing

# install tcpdump
sudo dnf tcpdump  # for network packet capturing

# install gobuster
sudo dnf gobuster  # for directory and file brute-forcing

# install openvas
sudo dnf openvas  # for vulnerability scanning




