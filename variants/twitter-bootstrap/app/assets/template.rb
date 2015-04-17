copy_file 'variants/twitter-bootstrap/app/assets/stylesheets/bootstrap_overrides.sass',
          'app/assets/stylesheets/bootstrap_overrides.sass'

insert_into_file 'app/assets/javascripts/application.js', before: '//= require_tree .' do
  <<-'RUBY'
//= require bootstrap-sprockets
  RUBY
end
