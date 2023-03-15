#!/bin/bash

# Set the URL to request
url="https://example.com"

# Make the request using curl
response=$(curl -s -o /dev/null -w "%{http_code}" "$url")

# Print the response code
echo "Response code: $response"

