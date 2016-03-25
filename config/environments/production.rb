uncomment_lines 'config/environments/production.rb', /for NGINX/i

insert_into_file 'config/environments/production.rb', after: "# config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)\n" do
  <<-'RUBY'

  # Log to environment log file, keep 7, max size 100mb
  config.logger = ActiveSupport::TaggedLogging.new(Logger.new(Rails.root.join('log', Rails.env + '.log'), 7, 104_857_600))
  RUBY
end

insert_into_file 'config/environments/production.rb', after: "config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?\n" do
  <<-'RUBY'

  # Enable deflate / gzip compression of controller-generated responses
  config.middleware.use Rack::Deflater
  RUBY
end

# mail settings
insert_into_file 'config/environments/production.rb', after: '# config.action_mailer.raise_delivery_errors = false' do
  <<-'RUBY'

  # Email settings example
  # config.action_mailer.asset_host = 'https://your-domain.tld'
  # config.action_mailer.default_url_options = { host: 'your-domain.tld', protocol: 'https' }
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
