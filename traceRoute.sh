#!/bin/bash

# Prompt user for IP address
read -p "Enter IP address to trace: " ip_address

# Perform traceroute
traceroute $ip_address

