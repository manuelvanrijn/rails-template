generate 'rspec:install'
append_to_file '.rspec', "--require rails_helper\n"
append_to_file '.rspec', "--format Fuubar\n"

uncomment_lines 'spec/rails_helper.rb', /Dir/
# don't use transactional_fixtures
comment_lines 'spec/rails_helper.rb', /config.use_transactional_fixtures/

apply 'variants/default/simplecov.rb'

copy_file 'spec/support/capybara.rb'
copy_file 'spec/support/database_cleaner.rb'
copy_file 'spec/support/factory_bot.rb'
copy_file 'spec/support/profile_factory_bot.rb'
copy_file 'spec/support/shoulda_matchers.rb'
copy_file 'spec/support/spec_file_name_enforcer.rb'
copy_file 'spec/support/tasks.rb'
copy_file 'spec/support/time_helpers.rb'

copy_file 'spec/tasks/example_spec.rb'
