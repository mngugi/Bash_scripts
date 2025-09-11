#!/bin/bash

# Update and upgrade package list
echo "====================================="
echo "     Data Science Tool For Debian OS"
echo "====================================="
sudo apt update && sudo apt upgrade -y

# Install required system packages
sudo apt install -y python3-pip python3-gi python3-sphinx micropython

# Install virtual environment package (in case it's not already installed)
sudo apt install -y python3-venv

# Create a virtual environment
python3 -m venv myenv

# Activate the virtual environment
source myenv/bin/activate

# Install statsmodels separately (optional step)
python -m pip install statsmodels

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
  jupyterlab \
  jupyter \
  tox \
  dask \
  bokeh

# List all installed packages and their versions
pip list

# Deactivate the virtual environment
deactivate
