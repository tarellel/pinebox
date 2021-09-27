web: env bundle exec rails s -u puma -b 0.0.0.0 -p 3000
redis: redis-server /usr/local/etc/redis.conf
sidekiq: env bundle exec sidekiq -C ./config/sidekiq.yml
# reload: bundle exec guard
