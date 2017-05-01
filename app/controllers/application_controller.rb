insert_into_file 'app/controllers/application_controller.rb', after: /ActionController::Base\n/ do
  <<-RUBY
  include LogragePayload
  include DecorateInstanceVariables
  RUBY
end
