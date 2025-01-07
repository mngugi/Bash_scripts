#!/usr/bin/bash
echo "====================================="
echo "     Read File Path"
echo "====================================="
read -p 'File: ' FILENAME
FPATH='readlink -f $FILENAME'
echo 'Full path: ' $FPATH
