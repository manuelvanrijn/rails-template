apply 'variants/twitter-bootstrap/app/assets/javascripts/application.js.rb'

copy_file 'variants/twitter-bootstrap/app/assets/stylesheets/bootstrap_overrides.sass',
          'app/assets/stylesheets/bootstrap_overrides.sass'

append_to_file 'app/assets/stylesheets/_components.sass' do
  <<-'RUBY'

// bootstrap-sass
@import bootstrap-sprockets
@import bootstrap
@import rails_bootstrap_forms
  RUBY
end
