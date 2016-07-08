Rails.application.config.generators do |generate|
  # Disable generators we don't need.
  generate.helper false
  generate.view_specs false
  generate.routing_specs false
  generate.request_specs false
  generate.controller_specs false
  generate.assets false
  generate.jbuilder false
end
