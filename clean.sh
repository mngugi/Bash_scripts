#!/bin/bash

sudo dnf clean all
sudo dnf reinstall kernel-devel
sudo fsck /dev/sdXY

