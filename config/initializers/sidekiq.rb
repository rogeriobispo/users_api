Sidekiq.configure_server do |config|
  config.redis  = { url: ENV['REDIS_URL'], namespace: 'firstleaf_user_sidekiq' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'], namespace: 'firstleaf_user_sidekiq' }
end
