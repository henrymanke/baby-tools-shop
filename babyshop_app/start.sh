#!/bin/sh

# Create Default admin
python manage.py create_default_admin

# Load environment variables from .env file if it exists
if [ -f /app/.env ]; then
  export $(grep -v '^#' /app/.env | xargs)
fi

# Check if LOAD_SAMPLE_DATA is set to true and run samples.sh if true
if [ "$LOAD_SAMPLE_DATA" = "true" ]; then
  /app/samples.sh
fi

# Start the Gunicorn server
gunicorn --bind 0.0.0.0:8025 babyshop.wsgi:application
