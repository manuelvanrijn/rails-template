# generate 'responders:install'

copy_file 'lib/application_responder.rb'
copy_file 'config/locales/responders.nl.yml'
copy_file 'config/locales/responders.en.yml'

# inject_into_class 'config/application.rb', 'Application', <<-RUBY
#     config.app_generators.scaffold_controller :custom_controller
# RUBY

prepend_file 'app/controllers/application_controller.rb', %{require 'application_responder'\n\n}
inject_into_class 'app/controllers/application_controller.rb', 'ApplicationController', <<-RUBY
  self.responder = ApplicationResponder
  respond_to :html, :json
RUBY
