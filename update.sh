#!/bin/bash

sudo dnf update
sudo dnf upgrade

sudo dnf --refresh update 
sudo dnf install dnf-plugin-system-upgrade
sudo dnf install dnf-plugin-system-upgrade
sudo dnf system-upgrade download --releasever=39
sudo dnf system-upgrade reboot
