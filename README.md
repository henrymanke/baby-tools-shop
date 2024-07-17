# Baby Tools Shop

## Table of Contents
- [About the Project](#about-the-project)
- [Quickstart](#quickstart)
- [Usage](#usage)
- [Configuration](#configuration)
- [Security Notes](#security-notes)
- [Project Structure](#project-structure)

## About the Project
The Baby Tools Shop is a Django-based web application designed to provide an easy setup and deployment process for a basic e-commerce platform specializing in baby products. This repository contains all necessary files to build and run the application within a Docker container.

## Quickstart

### Prerequisites
- Docker
- Git

### Installation and Launch
1. **Clone the repository:**
   ```bash
   git clone https://github.com/henrymanke/baby-tools-shop.git
   cd baby-tools-shop
   ```

2. **Create a `.env` file in the project root directory and configure it for initial setup:**
   ```plaintext
   LOAD_SAMPLE_DATA=true
   ```

3. **Build and run the Docker image:**
   ```bash
   docker-compose up --build
   ```

The application will be accessible via `http://0.0.0.0:80`.

To restart the application without rebuilding, simply run:
```bash
docker-compose up
```

## Usage

### Configuration
Configure the application using environment variables to secure and customize your setup:

1. **Create a `.env` file in the root directory of your project.**
2. **Define the necessary environment variables. Replace `<YOUR_VALUE>` with actual values where applicable:**

   ```plaintext
    # django configuration
    SECRET_KEY=<your-secret-key-here>
    ALLOWED_HOSTS=<your-allowed-hosts-list>
    
    # admin user credentials
    ADMIN_USERNAME=<your-admin-username>
    ADMIN_EMAIL=<your-admin-email>
    ADMIN_PASSWORD=<your-admin-password>
    
    # debugging options
    PYTHONUNBUFFERED=<python-unbuffered-value>
    DEBUG=<true-or-false>
    
    # sample data
    LOAD_SAMPLE_DATA=<true-or-false>
   ```

   **Example Configuration:**
   ```plaintext
    SECRET_KEY=your_secret_key_here
    ALLOWED_HOSTS=127.0.0.1,0.0.0.0
    ADMIN_USERNAME=admin
    ADMIN_EMAIL=admin@example.com
    ADMIN_PASSWORD=adminpass
    PYTHONUNBUFFERED=1
    DEBUG=true
    LOAD_SAMPLE_DATA=true
   ```

### Running the Application
With the environment variables set, you can manage the application lifecycle as follows:
- **Start the application**: `docker-compose up`
- **Stop the application**: `docker-compose down`

The application is accessible at `http://127.0.0.1:80` and `http://0.0.0.0:80` -> Depending on example `.env`

## Security Notes
- **Sensitive Data**: Do not store SSH keys, passwords, tokens, or usernames in your code. Always use environment variables.
- **Repository Security**: Avoid storing sensitive information such as IP addresses in your Git repository.
- **Environment Variables**: Follow proper naming conventions for environment variables and shell variables to prevent errors in code interpretation.

Contributions are welcome! Feel free to submit issues or pull requests. For any questions, please open an issue on GitHub.

### Project Structure

#### Additional Files and Directories Description

##### `docker-compose.yml`
- **Description**: Defines Docker services, networks, and volumes for the application setup.
- **Purpose**: Simplifies container management and deployment.

##### `nginx/`
- **Description**: Contains Nginx-specific configurations for reverse proxy settings.
  - `dockerfile`: Sets up the Nginx server within a Docker container.
  - `nginx.conf`: Configures server settings for request handling and forwarding.
  
- **Purpose**: Enhances application performance and security.

##### `samples.sh`
- **Description**: Loads sample data into the Django database and manages media files.
- **Purpose**: Facilitates development and testing by providing a pre-populated data environment.

##### `start.sh`
- **Description**: Manages application startup processes inside the Docker container.
- **Purpose**: Automates application initialization and server management.

##### `create_default_admin.py`
- **Description**: Creates a default admin user via Django's command-line interface if not present.
- **Purpose**: Streamlines admin user setup during application deployment.


## Disclaimer

This project is provided as-is, without any tests. It has not been extensively tested in production environments. Users should be aware that there are inherent risks involved in deploying a project without a comprehensive suite of tests. Please use caution and consider adding your own tests before going live with this application in a production environment.
