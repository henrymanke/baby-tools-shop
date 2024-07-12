# Baby Tools Shop

## Table of Contents
- [About the Project](#about-the-project)
- [Quickstart](#quickstart)
- [Usage](#usage)
- [Configuration](#configuration)
- [Security Notes](#security-notes)

## About the Project
The Baby Tools Shop is a web application developed using Django. This repository contains all the necessary files to build and run the application in a Docker container. The main purpose of this repository is to provide an easy setup and deployment process for a basic e-commerce platform focusing on baby products.

## Quickstart

### Prerequisites
- Docker
- Git

### Installation and Launch
Clone the repository and navigate to the project directory:

```bash
git clone https://github.com/henrymanke/baby-tools-shop.git
cd baby-tools-shop
```

Create a .env file in the project root directory and add the following environment variables:

```plaintext
DATABASE_URL=sqlite:///db.sqlite3
SECRET_KEY=myverysecretkey
DEBUG=True
ALLOWED_HOSTS=localhost,127.0.0.1
```

Build the Docker image:
```bash
docker build -t baby-tools-shop .
```

Run the application with Docker, setting it up to automatically manage restarts and data persistence:
```bash
# Use the home directory for data storage
DATA_PATH=$HOME/baby-tools-shop-data
mkdir -p $DATA_PATH

# Run without loading sample data
docker run --env-file .env --env DATA_PATH=$DATA_PATH --restart unless-stopped -p 8025:8025 -v $DATA_PATH:/data --name baby-tools-shop baby-tools-shop

# Run with loading sample data
docker run --env-file .env --env LOAD_SAMPLE_DATA=true --env DATA_PATH=$DATA_PATH --restart unless-stopped -p 8025:8025 -v $DATA_PATH:/data --name baby-tools-shop baby-tools-shop

```


The application should now be accessible via `http://localhost:8025`.

## Usage

### Configuration
This application uses environment variables for configuration to enhance security and protect sensitive data. To set up the environment variables:

1. Create a file named `.env` in the root directory of your project.
2. Add the following environment variables to the `.env` file and replace `<YOUR_VALUE>` with actual values:

   ```plaintext
   DATABASE_URL=<YOUR_DATABASE_URL>
   SECRET_KEY=<YOUR_SECRET_KEY>
   DEBUG=<True/False>
   ALLOWED_HOSTS=<LIST_OF_HOSTS>
   ```

   Example:
   ```plaintext
   DATABASE_URL=postgres://username:password@localhost:5432/mydatabase
   SECRET_KEY=myverysecretkey
   DEBUG=False
   ALLOWED_HOSTS=localhost,127.0.0.1
   ```

### Running the Application
After setting up the environment variables, you can start the application as follows:

```bash
# Ensure DATA_PATH is set in your environment
DATA_PATH=$HOME/baby-tools-shop-data
docker run --env-file .env --env DATA_PATH=$DATA_PATH --restart unless-stopped -p 8025:8025 -v $DATA_PATH:/data --name baby-tools-shop baby-tools-shop
```

The application is now running on `http://localhost:8025`.

### Useful Commands
To further manage your application's lifecycle, you can execute the following Docker commands:

- **Apply database migrations**: Execute the following command to apply migrations:
  ```bash
  docker exec -it baby-tools-shop python manage.py migrate
  ```

- **Create an admin user**: To create an admin user, use:
  ```bash
  docker exec -it baby-tools-shop python manage.py createsuperuser
  ```

## Security Notes
- Do not store SSH keys, passwords, tokens, or usernames in your code. Use environment variables instead.
- Avoid storing sensitive information such as IP addresses in the Git repository.
- Follow the naming conventions for environment variables and shell variables to prevent errors in code interpretation.

Feel free to contribute to this project by submitting issues or pull requests. For any questions, please submit an issue on GitHub.

This update integrates the Docker configurations fully into the quick start and usage sections, emphasizing best practices for security and data persistence.