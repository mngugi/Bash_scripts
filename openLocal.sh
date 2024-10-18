#!/bin/bash

# Start a simple HTTP server using Python in the background
python3 -m http.server 8000 &

# Give the server a second to start
sleep 2

# Open the default web browser and navigate to http://localhost:8000
xdg-open http://localhost:8000   # For Linux

# For macOS, use the following line instead:
# open http://localhost:8000

