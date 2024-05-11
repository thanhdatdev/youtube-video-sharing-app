require 'mina/rails'
require 'mina/git'
require 'mina/logs'


# Set your server information
set :user, 'ubuntu'
set :domain, '18.141.12.245'

# Deployment task
task :deploy => :remote_environment do
  command 'cd /home/ubuntu/youtube-video-sharing-app'
  command 'git pull origin main'
  command 'docker compose build'
  command 'docker compose down'
  command 'docker compose up -d'
  command 'docker compose run web rake db:migrate'

  # Clean up unused Docker resources
  command 'docker system prune -f'
end
