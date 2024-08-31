#!/bin/bash
# Author : Peter Mwangi Ngugi
# Use: This program is used for Fedora OS but can be edited to work for 
# any other operating systems. 

# Activate virtual environment to have all tools working in one location.
python3 -m venv project_venv

# run the project requests package 
python -m pip install requests

# Acivate virtual environment
source project_venv/bin/activate

# incase you need to use the cowsay :)
python -m pip install --user cowsay

#install pip for python packages installations
sudo dnf install python3-pip

# Install the Gekko optimization library
pip install gekko

# Install BeautifulSoup4 and lxml for web scraping
pip install beautifulsoup4 lxml

# Repeated installation of Gekko; you can remove this line as it's redundant
pip install gekko

# Install Keras for deep learning
pip install keras

# Install Matplotlib for data visualization
pip install matplotlib

# Install NumPy for numerical computations
pip install numpy

# Install OpenCV-Python for computer vision tasks
pip install opencv-python

# Install Pandas for data manipulation
pip install pandas

# Install Pandas Profiling for exploratory data analysis (with notebook support)
pip install pandas-profiling[notebook]

# Enable Jupyter Notebook widget extensions
jupyter nbextension enable --py widgetsnbextension

# Install Plotly for interactive data visualization
pip install plotly

# Install PyTorch for deep learning
pip install torch

# Install scikit-learn for machine learning tasks
pip install scikit-learn

# Install SciPy for scientific and technical computing
sudo dnf install python3-scipy

# Install Seaborn for data visualization
pip install seaborn

# Install StatsModels for statistical modeling
pip install statsmodels

# Install the TcLab package
pip install tclab

# Install TensorFlow for deep learning
pip install tensorflow

# Install XGBoost for gradient boosting
pip install xgboost

# Multiple pythons
sudo dnf install python3.12 # to get CPython 3.12
sudo dnf install python3.9  # to get CPython 3.9
sudo dnf install python3.8  # to get CPython 3.8
sudo dnf install python3.7  # to get CPython 3.7
sudo dnf install python3.6  # to get CPython 3.6
sudo dnf install python2.7  # to get CPython 2.7
sudo dnf install pypy2 pypy3.9 python3.10  # to get more at once
sudo dnf install tox

#install SymPy by running:

sudo dnf install python3-sympy

# install jupyter notebook
sudo dnf install notebook

# install ipython
sudo dnf install python3-ipython


# get all on tox
python -m pip install pipx-in-pipx --user
pipx install tox
tox --help

# install pip env
sudo dnf install pipenv

#install sphinx
sudo dnf install python3-sphinx

# install PyGobject
sudo dnf install python3-gobject

#install microPython
sudo dnf install micropython
# List all installed packages and their versions
pip list
# Enable Jupyter notebook extensions
jupyter nbextension enable --py widgetsnbextension

# install git
sudo dnf install git

# install gnuplot 
sudo dnf install gnuplot

# install GNU Octave 
sudo dnf -y install scilab

# install R - programming
sudo dnf -y install rkward

# install R development in jupyter
sudo dnf -y install czmq-devel

# updates 
python -m pip install --update requests

