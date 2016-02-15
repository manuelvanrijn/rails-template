Airbrake.configure do |config|
  config.project_key = ENV['ERRBIT_PROJECT_KEY'].to_s
  config.host        = ENV['ERRBIT_HOST'].to_s
end
