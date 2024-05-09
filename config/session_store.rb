Rails.application.config.session_store :redis_store,
                                       secure: false,
                                       servers: "#{ENV['REDIS_SIDEKIQ_URL']}/session"
