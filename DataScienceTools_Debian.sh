#!/bin/bash

# Update package list
sudo apt update

# Install pip
sudo apt install python3-pip

# Create a virtual environment
python3 -m venv myenv

# Activate the virtual environment
source myenv/bin/activate

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

# Install Plotly for interactive data visualization
pip install plotly

# Install PyTorch for deep learning
pip install torch

# Install scikit-learn for machine learning tasks
pip install scikit-learn

# Install SciPy for scientific and technical computing
pip install scipy

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

# Install PyGobject
sudo apt install python3-gi

# Install Sphinx
sudo apt install python3-sphinx

# Install MicroPython
sudo apt install micropython

# Install Jupyter notebook
pip install notebook

# Install IPython
pip install ipython

# Install tox
pip install tox

# List all installed packages and their versions
pip list

# Deactivate the virtual environment
deactivate

