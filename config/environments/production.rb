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
