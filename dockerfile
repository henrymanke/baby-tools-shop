# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY baby-tools-shop/babyshop_app /app

# Install any needed packages specified in requirements.txt
# Ensure you have a requirements.txt in the babyshop_app directory or adjust the path below
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

# Command to run the application
CMD ["gunicorn", "--bind", "0.0.0.0:8025", "babyshop.wsgi:application"]
