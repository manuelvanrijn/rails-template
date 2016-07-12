Airbrake.configure do |config|
  config.project_id   = 1
  config.project_key  = ENV.fetch('ERRBIT_PROJECT_KEY', '_')
  config.host         = ENV.fetch('ERRBIT_URL', '')
end
