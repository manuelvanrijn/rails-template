mailer_regex = /config\.action_mailer\.raise_delivery_errors = false\n/

comment_lines 'config/environments/development.rb', mailer_regex
insert_into_file 'config/environments/development.rb', after: mailer_regex do
  <<-RUBY

  # Ensure mailer works in development.
  config.action_mailer.delivery_method = :letter_opener
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = { host: 'localhost:3000' }
  config.action_mailer.asset_host = 'http://localhost:3000'
  RUBY
end

insert_into_file 'config/environments/development.rb', before: /^end/ do
  <<-RUBY

  # Bullet configuration
  config.after_initialize do
    Bullet.enable = true
    Bullet.bullet_logger = true
    Bullet.rails_logger = true
  end

  # Disable lograge for development
  config.lograge.enabled = false
  RUBY
end

# Cache
comment_lines 'config/environments/development.rb', /config.cache_store = :memory_store/
insert_into_file 'config/environments/development.rb', after: /config.cache_store = :memory_store\n/ do
  <<-RUBY
    config.cache_store = :readthis_store, {
      expires_in: 1.hour.to_i,
      namespace: 'cache',
      redis: {
        url: ENV.fetch('REDIS_URL'),
        driver: :hiredis
      }
    }
  RUBY
end
