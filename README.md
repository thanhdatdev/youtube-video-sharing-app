# Youtube Video Sharing App

## Introduction

Welcome to our YouTube Video Sharing App! Our platform allows users to easily share any YouTube video with others, fostering a community of shared interests and entertainment.

### Live Demo:

- Access our live demo [here](https://dat.mktsoft.vip).

### Account Demo:

- Email: `admin@gmail.com`
- Password: `abcd1234!`

## Key Features:

- **Effortless Sharing**: Share your favorite YouTube videos with just a few clicks.
- **Voting the Video You Like**: Engage with the community by voting for the videos you enjoy the most.
- **Community Engagement**: Connect with others by discovering and enjoying videos shared by fellow users.
- **Modern Technology Stack**: Built on `Rails 7 and Ruby 3`, leveraging the latest advancements in web development.
- **Scalable Infrastructure**: Utilizes `nginx` for high-performance web serving and load balancing.
- **Secure HTTPS**: Secured with `AWS` and `certbot` for HTTPS encryption, ensuring user privacy and data integrity.

## Prerequisites

### For manually

1. Install Ruby with version 3.2.2 (recommend use asdf (`https://asdf-vm.com/guide/getting-started.html`))
2. Install Redis with version 6.2 (`https://redis.io/docs/latest/operate/oss_and_stack/install/install-redis/`)
3. Install Postgresql with version 14.11 (`https://www.postgresql.org/download/`)

### For Docker

1. Install the Docker(`https://docs.docker.com/get-docker/`). To the best performance, please setting the Docker with 2 CPU, 4G RAM

## Installation & Configuration

### For manually

1. `git clone git@github.com:thanhdatdev/youtube-video-sharing-app.git`
2. Change the name `application.example.yml` (in `config` folder) to `application.yml`
3. Make sure your Redis and Postgresql are loaded locally.
4. Run `bundle install`

### For Docker

1. Change the name `application.docker-example.yml` (in `config` folder) to `application.yml`
2. Run `docker compose up --build -d`

## Database Setup

### For manually

1. Run `rake db:create`
2. Run `rake db:migrate`

### For Docker

1. Run `docker compose run web rake db:create`
2. Run `docker compose run web rake db:migrate`

## Running the Application

### For manually

1. Run `rails s`

### For Docker

1. Run `docker compose up --build -d`

## Docker Deployment

1. `git add .`
2. `git commit -m 'Deploy to Production'`
3. `git push origin main`
4. `mina deploy`

## Test

1. Run `rake test`

## Usage

1. Access `localhost:3000`: Open your web browser and navigate to `localhost:3000` to access the application.
2. Log in or Create an Account: Enter your email and password. If you don't have an account, one will be created for you automatically. Existing users will be logged in.
3. Share a Youtube Video: Click on the "Share a movie" button and paste the URL of the Youtube video you want to share. Make sure to paste the entire URL from your browser's address bar.
4. Receive Notifications: Other users will receive notifications when you share a new video.

## Troubleshooting

If you encounter any issues while using our YouTube Video Sharing App, refer to the troubleshooting guide below for assistance.

### Issue: Incorrect Postgresql User

If your Postgresql container default user is set to `root` instead of `postgres`, it may cause authentication issues.

#### Solution:

1. Access the Postgresql container using the command: `docker exec -it <<postgres-container-id>> bash`
2. Once inside the container, access the Postgresql database as the `root` user: `psql -U root;`
3. Execute the following command to create a new user with the appropriate privileges: `CREATE ROLE postgres WITH LOGIN SUPERUSER PASSWORD 'postgres';`
