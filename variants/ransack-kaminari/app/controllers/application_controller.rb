insert_into_file 'app/controllers/application_controller.rb', after: /include LogragePayload\n/ do
  <<-RUBY
  include ActiveModelSerializerPagination
  RUBY
end
