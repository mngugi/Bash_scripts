#!/bin/bash
echo
# Install Python packages using pip
pip install gekko
pip install beautifulsoup4 lxml
pip install keras
pip install matplotlib
pip install numpy
pip install opencv-python
pip install pandas
pip install pandas-profiling[notebook]
pip install plotly
pip install torch
pip install scikit-learn
pip install scipy
pip install seaborn
pip install statsmodels
pip install tclab
pip install xgboost

# Enable Jupyter notebook extensions
jupyter nbextension enable --py widgetsnbextension

