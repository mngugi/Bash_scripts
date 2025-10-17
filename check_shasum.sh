#!/bin/bash

# Simple SHA256 generator
# Usage: ./checksum.sh filename

if [ -z "$1" ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

if [ ! -f "$1" ]; then
  echo "Error: File not found!"
  exit 1
fi

echo "Generating SHA256 checksum for $1..."
shasum -a 256 "$1"

