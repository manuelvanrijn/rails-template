apply 'variants/twitter-bootstrap/app/assets/javascripts/application.js.rb'

copy_file 'variants/twitter-bootstrap/app/assets/stylesheets/bootstrap_overrides.sass',
          'app/assets/stylesheets/bootstrap_overrides.sass'
copy_file 'variants/twitter-bootstrap/app/assets/stylesheets/_vars.sass',
          'app/assets/stylesheets/_vars.sass'

append_to_file 'app/assets/stylesheets/_components.sass' do
  <<-RUBY

@import rails_bootstrap_forms
  RUBY
end
