apply 'config/application.rb'
apply 'config/environments/development.rb'
apply 'config/environments/production.rb'
apply 'config/environments/test.rb'
template 'config/environments/staging.rb.tt', 'config/environments/staging.rb'

template 'config/database.yml.tt', 'config/database.yml', force: true
template 'config/secrets.yml.tt', 'config/secrets.yml', force: true

# remove all comments
gsub_file('config/routes.rb', /^\s*#.*\n/, '')
# add root example
insert_into_file 'config/routes.rb', before: /^end/ do
  <<-'RUBY'
  root 'home#index'
  RUBY
end

# additional filtering for parameters
gsub_file 'config/initializers/filter_parameter_logging.rb', /\[:password\]/ do
  '%w(password password_confirmation secret session cookie csrf)'
end

copy_file 'config/initializers/assets.rb', force: true
copy_file 'config/initializers/errbit.rb'
copy_file 'config/initializers/lib_extensions.rb'
empty_directory 'lib/extensions'
copy_file 'config/initializers/version.rb'

# Locale templates
copy_file 'config/locales/en.yml', force: true
copy_file 'config/locales/nl.yml'
copy_file 'config/locales/nl.models.yml'
copy_file 'config/locales/en.models.yml'
