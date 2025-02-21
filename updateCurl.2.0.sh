  GNU nano 8.1                              updateCurl.2.0.sh                                         
#!/bin/bash

# Set the URL to request
echo "====================================="
echo "     Url Code"
echo "====================================="
url="https://github.com"

# Make the request using curl
response=$(curl -s -o /dev/null -w "%{http_code}" "$url")

# Print the response code
echo "Response code: $response"

zenity --progress --title="url loading progress " --text="loading .." --pulsate --auto-close --auto-k>

if [ $? -eq 0 ]; then
    zenity --info --title="Success" --text="url loading completed successfully!"
else
    zenity --error --title="Error" --text="Failed to load url . Please check your internet connection>
fi

