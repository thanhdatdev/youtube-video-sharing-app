# Youtube Video Sharing App

## Introduction

Welcome to our YouTube Video Sharing App, a platform designed to simplify the process of discovering and sharing YouTube videos with friends, family, and the wider online community. Our application aims to enhance your video-sharing experience by providing a seamless platform where users can register, log in, and effortlessly share their favorite YouTube content.

## Key Features

1. User Registration and Login:
   Our app offers a user-friendly registration and login system, ensuring that users can securely access their accounts and personalize their sharing experience. By registering, users gain access to a range of features and can start sharing videos with ease.
2. Sharing YouTube Videos:
   With our app, users can easily share YouTube videos they love with their network. Whether it's a hilarious cat video, a thought-provoking TED talk, or the latest music video sensation, sharing is as simple as copying and pasting the video URL into our platform.
3. Viewing a List of Shared Videos:
   Discovering new content is effortless with our app. Users can browse through a curated list of videos shared by others within the community. Whether searching for entertainment, education, or inspiration, there's something for everyone to enjoy.
4. Real-time Notifications for New Video Shares:
   One of our standout features is real-time notifications. When a user shares a new video, our platform ensures that other logged-in users receive instant notifications about the newly shared content. These notifications are delivered in real-time, appearing as pop-ups, keeping users engaged and up-to-date with the latest video uploads.

## Prerequisites

1. Install the Docker(`https://docs.docker.com/get-docker/`)
To the best performance, please setting the Docker with 2 CPU, 4G RAM

## Installation & Configuration

1. Change the name `application.example.yml` (in `config` folder) to `application.yml`
2. Run `docker compose up --build`

## Database Setup
1. `docker compose run web rake db:create`
2. `docker compose run web rake db:migrate`

## Running the Application

Explain how to start the development server, access the application in a web browser, and run the test suite.

## Deployment

`cap production deploy`
