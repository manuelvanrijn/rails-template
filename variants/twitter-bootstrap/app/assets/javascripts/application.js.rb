insert_into_file 'app/assets/javascripts/application.js', before: '//= require_tree .' do
  <<-'RUBY'
//= require bootstrap-sprockets
  RUBY
end
