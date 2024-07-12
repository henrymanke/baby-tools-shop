#!/bin/bash

# Check if LOAD_SAMPLE_DATA is set to true
if [ "$LOAD_SAMPLE_DATA" = "true" ]; then
  echo "Loading sample data..."
  cp /app/sample_data/example.sqlite3 /app/db.sqlite3
  cp -r /app/sample_data/images /app/static/images
fi

# Start the application
gunicorn --bind 0.0.0.0:8025 babyshop.wsgi:application
