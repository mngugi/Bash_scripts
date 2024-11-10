#!/bin/bash 

rpm -q kernel
sudo dnf remove --oldinstallonly --setopt installonly_limit=2 kernel

sudo grub2-mkconfig -o /boot/grub2/grub.cfg




sudo reboot 
