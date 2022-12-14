#!/usr/bin/bash

read -p 'File: ' FILENAME
FPATH='readlink -f $FILENAME'
echo 'Full path: ' $FPATH
