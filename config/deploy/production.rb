set :stage, :production
set :rails_env, 'production'
set :sidekiq_env, ->{ fetch(:rails_env, 'production') }
set :whenever_environment, ->{ fetch(:rails_env, 'production') }
set :puma_env, ->{ fetch(:rails_env, 'production') }
server '18.141.12.245', user: 'deploy', roles: %w[web app db]
set :branch, 'master'
