#!/bin/bash

# Prompt the user for input
echo "====================================="
echo "     Telnet Tool"
echo "====================================="
echo "Enter connection IP:"
read IP

# Send an HTTP GET request to the specified IP address using telnet
(
echo "GET / HTTP/1.1"
echo "Host: $IP"
echo "Connection: close"
echo ""
sleep 1
) | telnet $IP 80

