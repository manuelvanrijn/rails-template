Rails.application.config.lograge.custom_options = lambda do |event|
  options = event.payload.slice(:subdomain, :uuid, :request_id, :user_id)
  options[:params] = event.payload[:params].except("controller", "action")
  options
end
