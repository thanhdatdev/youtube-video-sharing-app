require 'mina/rails'
require 'mina/git'
require 'mina/logs'

# Set your project name
set :application_name, 'youtube-video-sharing-app'

# Set your server information
set :user, 'deploy'
set :domain, '18.141.12.245'
set :deploy_to, '/home/deploy/youtube-video-sharing-app'

# Default branch to deploy
set :branch, 'main'
set :repository, 'git@github.com:thanhdatdev/youtube-video-sharing-app.git'

# Set shared directories
set :shared_dirs, ['log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'public/uploads']

# Set shared files
set :shared_files, ['config/application.yml', 'config/master.key']

# Remote environment task
task :remote_environment do
  # No need to define anything here unless you have specific environment setup tasks
  command %[mkdir -p "#{fetch(:deploy_to)}/releases"]
  command %[mkdir -p "#{fetch(:deploy_to)}/shared"]
end

# Deployment task
task :deploy => :remote_environment do
  deploy do
    # Ensure we are in the correct directory
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'

    on :launch do

      # Build and start the Docker containers
      command 'docker compose build'
      command 'docker compose down'
      command 'docker compose up -d'

      # Clean up unused Docker resources
      command 'docker system prune -f'
    end
  end
end
