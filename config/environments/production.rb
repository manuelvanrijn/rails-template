uncomment_lines 'config/environments/production.rb', /for NGINX/i
comment_lines 'config/environments/production.rb', /config.assets.js_compressor = :uglifier/

insert_into_file 'config/environments/production.rb', after: "config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?\n" do
  <<-'RUBY'

  # Enable deflate / gzip compression of controller-generated responses
  config.middleware.use Rack::Deflater
  RUBY
end

comment_lines 'config/environments/production.rb', /config.log_tags = \[ :request_id \]/
insert_into_file 'config/environments/production.rb', after: /config.log_tags = \[ :request_id \]\n/ do
<<-'RUBY'

  # Enable lograge for development
  config.lograge.enabled = true
  RUBY
end

# mail settings
insert_into_file 'config/environments/production.rb', after: '# config.action_mailer.raise_delivery_errors = false' do
  <<-'RUBY'

  # Email settings example
  # config.action_mailer.asset_host = 'https://your-domain.tld'
  # config.action_mailer.default_url_options = {
  #   host: 'your-domain.tld',
  #   protocol: 'https'
  # }
  # config.action_mailer.delivery_method = :smtp
  # config.action_mailer.smtp_settings = {
  #   address:                'smtp.gmail.com',
  #   port:                   '587',
  #   domain:                 'your-domain.tld',
  #   authentication:         'plain',
  #   enable_starttls_auto:   true,
  #   user_name:              ENV.fetch('SMTP_USERNAME'),
  #   password:               ENV.fetch('SMTP_PASSWORD')
  # }
  RUBY
end

insert_into_file 'config/environments/production.rb', after: /config.cache_store = :mem_cache_store\n/ do
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
