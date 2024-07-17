# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Define build-time environment variables
ARG SECRET_KEY
ARG PYTHONUNBUFFERED

ARG ADMIN_USERNAME
ARG ADMIN_EMAIL
ARG ADMIN_PASSWORD

ARG DEBUG=false
ARG ALLOWED_HOSTS
ARG LOAD_SAMPLE_DATA


# Set environment variables
ENV NAME=BabyToolsShop
ENV SECRET_KEY=${SECRET_KEY}
ENV PYTHONUNBUFFERED=${PYTHONUNBUFFERED}

ENV ADMIN_USERNAME=${ADMIN_USERNAME}
ENV ADMIN_EMAIL=${ADMIN_EMAIL}
ENV ADMIN_PASSWORD=${ADMIN_PASSWORD}

ENV DEBUG=${DEBUG}
ENV ALLOWED_HOSTS=${ALLOWED_HOSTS}
ENV LOAD_SAMPLE_DATA=${LOAD_SAMPLE_DATA}

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY babyshop_app /app

# Install any needed packages specified in requirements.txt
# Ensure you have a requirements.txt in the babyshop_app directory or adjust the path below
RUN pip install --no-cache-dir -r requirements.txt

# Ensure scripts are executable
RUN chmod +x /app/samples.sh /app/start.sh

# Collect static files
RUN python3 manage.py collectstatic --noinput

# Apply migrations
RUN python3 manage.py migrate --noinput

# Create Default admin
RUN python3 manage.py create_default_admin

# Make port 8025 available to the world outside this container
EXPOSE 8025

# Command to run the application
CMD ["gunicorn", "--bind", "0.0.0.0:8025", "babyshop.wsgi:application"]
