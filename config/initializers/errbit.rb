Airbrake.configure do |config|
  config.api_key = ENV['ERRBIT_API_KEY'].to_s
  config.host    = ENV['ERRBIT_HOSTNAME'].to_s
  config.port    = 443
  config.secure  = config.port == 443
end
