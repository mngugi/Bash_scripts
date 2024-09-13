#!/bin/bash

# Update and upgrade package list
sudo apt update && sudo apt upgrade -y

# Install required system packages
sudo apt install -y python3-pip python3-gi python3-sphinx micropython

# Install virtual environment package (in case it's not already installed)
sudo apt install -y python3-venv

# Create a virtual environment
python3 -m venv myenv

# Activate the virtual environment
source myenv/bin/activate

# Install Python packages in the virtual environment
pip install \
  gekko \
  beautifulsoup4 \
  lxml \
  keras \
  matplotlib \
  numpy \
  opencv-python \
  pandas \
  pandas-profiling[notebook] \
  plotly \
  torch \
  scikit-learn \
  scipy \
  seaborn \
  statsmodels \
  tclab \
  tensorflow \
  xgboost \
  notebook \
  ipython \
  tox

# List all installed packages and their versions
pip list

# Deactivate the virtual environment
deactivate
