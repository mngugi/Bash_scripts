#!/bin/bash
# Author : Peter Mwangi Ngugi
# Use: This program is used for Fedora OS but can be edited to work for any other operating systems. 

# Activate virtual environment to have all tools working in one location.
python3 -m venv project_venv

# Activate the virtual environment
source project_venv/bin/activate

# Install requests package
pip install requests

# Install cowsay (optional)
pip install cowsay

#Install statsmodel
python -m pip install statsmodels


# Install pip for Python package installations (usually pre-installed)
sudo dnf install python3-pip

# Install the Gekko optimization library
pip install gekko

# Install BeautifulSoup4 and lxml for web scraping
pip install beautifulsoup4 lxml

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

# Install multiple Python versions
sudo dnf install python3.12 python3.9 python3.8 python3.7 python3.6 python2.7 pypy2 pypy3.9 python3.10
sudo dnf install tox

# Install SymPy
sudo dnf install python3-sympy

# Install Jupyter Notebook
sudo dnf install notebook

# Install IPython
sudo dnf install python3-ipython

# Install pipx and tox
pip install pipx
pipx install tox
tox --help

# Install pipenv
sudo dnf install pipenv

# Install Sphinx for documentation
sudo dnf install python3-sphinx

# Install PyGobject
sudo dnf install python3-gobject

# Install MicroPython
sudo dnf install micropython

# List all installed packages and their versions
pip list

# Install git
sudo dnf install git

# Install gnuplot
sudo dnf install gnuplot

# Install GNU Octave
sudo dnf -y install scilab

# Install R Programming Environment
sudo dnf -y install rkward

# Install R development in Jupyter
sudo dnf -y install czmq-devel

# Update requests package
pip install --upgrade requests
