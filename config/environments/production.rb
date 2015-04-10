uncomment_lines 'config/environments/production.rb', /for nginx/i

insert_into_file 'config/environments/production.rb', after: "# config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)\n" do
  <<-'RUBY'

  # Log to environment log file, keep 7, max size 100mb
  config.logger = ActiveSupport::TaggedLogging.new(Logger.new(Rails.root.join('log', Rails.env + '.log'), 7, 104857600))
  RUBY
end
