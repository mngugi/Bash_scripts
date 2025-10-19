#!/bin/bash
# Author Peter Mwangi Ngugi
# program to clean old kernels

sudo dnf clean all
sudo dnf reinstall kernel-devel
sudo fsck /dev/sdXY

