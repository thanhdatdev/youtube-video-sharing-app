require 'mina/rails'
require 'mina/git'
require 'mina/logs'

task :deploy => :remote_environment do
  set :user, 'deploy'
  set :domain, '18.141.12.245'
  command %[cd /home/deploy/youtube-video-sharing-app]
  command %[git pull origin main]
  command %[docker compose build]
  command %[docker compose down]
  command %[docker compose up -d]
  command %[docker system prune -f]
  print("Deploy successful!")
end
