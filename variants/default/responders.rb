copy_file 'lib/application_responder.rb'
copy_file 'config/locales/responders.nl.yml'
copy_file 'config/locales/responders.en.yml'

prepend_file 'app/controllers/application_controller.rb', %{require 'application_responder'\n\n}
insert_into_file 'app/controllers/application_controller.rb', after: /DecorateInstanceVariables\n/ do
  <<-RUBY

  self.responder = ApplicationResponder
  respond_to :html, :json
  RUBY
end
