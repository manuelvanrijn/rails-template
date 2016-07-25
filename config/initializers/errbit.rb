Airbrake.configure do |config|
  config.environment          = Rails.env
  config.ignore_environments  = %w(development test)
  config.project_id           = 1
  config.project_key          = ENV.fetch('ERRBIT_PROJECT_KEY', '_')
  config.host                 = ENV.fetch('ERRBIT_URL', '')
end
