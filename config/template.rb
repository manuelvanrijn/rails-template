apply 'config/application.rb'
apply 'config/routes.rb'
template 'config/database.yml.tt', 'config/database.yml', force: true
template 'config/secrets.yml.tt', 'config/secrets.yml', force: true
copy_file 'config/cable.yml', force: true

apply 'config/environments/development.rb'
apply 'config/environments/production.rb'
apply 'config/environments/test.rb'
copy_file 'config/environments/staging.rb'

apply 'config/initializers/template.rb'
apply 'config/locales/template.rb'

insert_into_file 'config/boot.rb', after: "require 'bundler/setup' # Set up gems listed in the Gemfile.\n" do
  <<-RUBY
require 'bootsnap/setup'
  RUBY
end
