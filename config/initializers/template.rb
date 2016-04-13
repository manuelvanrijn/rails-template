# additional filtering for parameters
gsub_file 'config/initializers/filter_parameter_logging.rb', /\[:password\]/ do
  '%w(password password_confirmation secret session cookie csrf)'
end

# custom initializers
copy_file 'config/initializers/assets.rb', force: true
copy_file 'config/initializers/errbit.rb'
copy_file 'config/initializers/generators.rb'
copy_file 'config/initializers/haml.rb'
copy_file 'config/initializers/lib_extensions.rb'
copy_file 'config/initializers/rotate_log_dev_test.rb'
empty_directory 'lib/extensions'
copy_file 'config/initializers/version.rb'
