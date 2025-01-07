#!/bin/bash
echo "====================================="
echo "     Create Virtual Environment "
echo "====================================="

echo 

# Create a virtual environment and activate it (recommended)
python3 -m venv venv # setup a python3 virtualenv
source venv/bin/activate

# Install external dependencies
pip install -r requirements/testing.txt

# Install Superset in editable (development) mode
pip install -e .

# Initialize the database
superset db upgrade

# Create an admin user in your metadata database (use `admin` as username to be able to load the examples)
superset fab create-admin

# Create default roles and permissions
superset init

# Load some data to play with.
# Note: you MUST have previously created an admin user with the username `admin` for this command to work.
superset load-examples

# Start the Flask dev web server from inside your virtualenv.
# Note that your page may not have CSS at this point.
# See instructions below how to build the front-end assets.
FLASK_ENV=development superset run -p 8088 --with-threads --reload --debugger

