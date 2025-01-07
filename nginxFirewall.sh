#! /bin/bash
# Author Peter Mwangi Ngugi
echo "====================================="
echo "     Firewall Add Service"
echo "====================================="
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
