`README.md` for project
---
# Project Name

Web portal

## Requirements

- [Docker](https://www.docker.com/) (for containerization)
- [Docker Compose](https://docs.docker.com/compose/) (for orchestration)

## Installation

### Step 1: Clone the Repository

```bash
git clone https://github.com/SurkovKostiantyn/webportal
cd webportal
```

### Step 2: Build and Start the Project

This command builds the Docker containers and starts the application.

```bash
docker-compose up --build
```

### Step 3: Stop the Project

To stop all running containers:

```bash
docker-compose down
```

### Step 4: Run Application Commands

You can run various application-specific commands within the `app` container. Here are a few examples:

- **Install Composer dependencies**:
  ```bash
  docker-compose exec app composer install
  ```
- **Update Composer dependencies**:
  ```bash
  docker-compose exec app composer update
  ```
- **Install a new package**:
  ```bash
  docker-compose exec app composer require package/name
  ```
- **Run database migrations**:
  ```bash
  docker-compose exec app php artisan migrate
  ```

## Project Structure and Important Files

- **Dockerfile**: Defines the environment and dependencies for the application, including the base image, PHP version, and installation of required extensions.
- **docker-compose.yml**: Manages multi-container deployment with services like the app, database, and Nginx.
- **nginx/**:
    - **nginx.conf**: Configures the Nginx server, including port settings, document root, and proxying to the PHP container.
- **.env**: Contains environment variables used by Docker and the application. Rename this file to `.env` and adjust values as needed.

## Additional Commands

To run any other commands or tasks within the application container, use the `docker-compose exec` format.

