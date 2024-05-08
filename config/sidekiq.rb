Sidekiq.default_worker_options['retry'] = 1

sidekiq_config = { url: ENV['REDIS_SIDEKIQ_URL'] }

Sidekiq.configure_client do |config|
  config.redis = sidekiq_config
end

Sidekiq.configure_server do |config|
  config.redis = sidekiq_config
end
