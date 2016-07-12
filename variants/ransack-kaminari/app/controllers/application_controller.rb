insert_into_file 'app/controllers/application_controller.rb', after: /include DecorateInstanceVariables\n/ do
  <<-'RUBY'
  include ActiveModelSerializerPagination
  RUBY
end
