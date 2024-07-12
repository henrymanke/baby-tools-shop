# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY babyshop_app /app

# Copy sample data into the container at /app/sample_data
COPY sample_data /app/sample_data

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8025 available to the world outside this container
EXPOSE 8025

# Define environment variables (ensure to set actual environment variables for production)
ENV NAME BabyToolsShop
ENV DJANGO_SETTINGS_MODULE=babyshop.settings
ENV PYTHONUNBUFFERED=1

# Collect static files
RUN python manage.py collectstatic --noinput

# Apply migrations
RUN python manage.py migrate

# Copy the startup script into the container
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# Command to run the application
CMD ["/app/start.sh"]
