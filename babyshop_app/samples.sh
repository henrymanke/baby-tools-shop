#!/bin/sh

# Ensure script stops on error
set -e

echo "Loading sample data..."

# Check if Django project directory is correctly set as the working directory
if [ ! -f manage.py ]; then
    echo "! Error: manage.py not found. Are you in the right directory?"
    exit 1
fi

# Load sample data from JSON fixture
echo "Importing fixture data..."
python3 manage.py loaddata products/fixtures/products_data.json

# Check if the sample data directory exists before copying
if [ -d "/app/products/fixtures/images" ]; then
    echo "Copying sample images to media directory..."
    cp -r /app/products/fixtures/images/* /app/media/
else
    echo "! Warning: Sample image directory does not exist."
fi

echo "Sample data and images have been loaded successfully."
