#!/bin/sh

# Change to the directory where the script is running
cd "$(dirname "$0")"

# Check if the api directory exists
if [ -f "$1/api/composer.json" ]; then
  echo "Symfony API found"
  exit 0
else
  echo "No Symfony API found"
  exit 1
fi
