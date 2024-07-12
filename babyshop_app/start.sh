#!/bin/bash

# Check if LOAD_SAMPLE_DATA is set to true
if [ "$LOAD_SAMPLE_DATA" = "true" ]; then
  echo "Loading sample data..."
  cp /app/sample_data/sample.sqlite3 /app/db.sqlite3
  cp -r /app/sample_data/media /app/media/

  # Create .env file with ALLOWED_HOSTS set to 0.0.0.0
  echo -e "ALLOWED_HOSTS=0.0.0.0" > /app/.env
fi

# Load environment variables from .env file if it exists
if [ -f /app/.env ]; then
  export $(grep -v '^#' /app/.env | xargs)
fi

# Start the application
gunicorn --bind 0.0.0.0:8025 babyshop.wsgi:application
