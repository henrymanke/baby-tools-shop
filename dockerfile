# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY babyshop_app /app

# Install any needed packages specified in requirements.txt
# Ensure you have a requirements.txt in the babyshop_app directory or adjust the path below
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8025 available to the world outside this container
EXPOSE 8025

# Define environment variables (ensure to set actual environment variables for production)
ENV NAME BabyToolsShop
ENV DJANGO_SETTINGS_MODULE=babyshop.settings
ENV PYTHONUNBUFFERED=1

# Ensure scripts are executable
RUN chmod +x /app/samples.sh /app/start.sh

# Collect static files
RUN python3 manage.py collectstatic --noinput

# Apply migrations
RUN python3 manage.py migrate --noinput

# Create Default admin
RUN python3 manage.py create_default_admin

# Command to run the application
CMD ["gunicorn", "--bind", "0.0.0.0:8025", "babyshop.wsgi:application"]
