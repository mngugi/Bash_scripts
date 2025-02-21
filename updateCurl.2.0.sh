#!/bin/bash

# Set the URL to request
echo "====================================="
echo "     URL Code"
echo "====================================="
url="https://github.com"

# Show Zenity progress while loading
zenity --progress --title="URL Loading Progress" \
       --text="Loading..." --pulsate --auto-close --no-cancel &

progress_pid=$!  # Store the progress dialog process ID

# Make the request using curl
response=$(curl -s -o /dev/null -w "%{http_code}" "$url")

# Close the progress dialog
kill $progress_pid 2>/dev/null

# Print the response code
echo "Response code: $response"

# Show success or error message
if [ "$response" -eq 200 ]; then
    zenity --info --title="Success" --text="URL loaded successfully! Response Code: $response"
else
    zenity --error --title="Error" --text="Failed to load URL. Response Code: $response. Please check your internet connection."
fi

