#!/bin/bash

# =====================================
#  Machine Learning Tool Set Setup
#  Author: Peter Mwangi Ngugi 
# =====================================

echo "====================================="
echo "     ML Tool Set Installer"
echo "====================================="

# Update and upgrade package list
sudo apt update && sudo apt upgrade -y

# Install required system packages
sudo apt install -y python3-pip python3-venv python3-dev build-essential

# Create a virtual environment
python3 -m venv ml_env

# Activate the virtual environment
source ml_env/bin/activate

# Upgrade pip
pip install --upgrade pip

# Install core ML packages
pip install \
  lightgbm \
  gym \
  catboost \
  huggingface-hub \
  transformers

# List all installed packages
echo "====================================="
echo "   Installed Packages and Versions"
echo "====================================="
pip list

# Deactivate virtual environment
deactivate

echo "====================================="
echo "   ML Tool Set Installation Complete"
echo "====================================="
