copy_file 'variants/default/harrow_git_config', 'harrow_git_config'
run 'GIT_CONFIG=harrow_git_config bundle exec cap install STAGES=staging,production'
remove_file 'harrow_git_config'

uncomment_lines 'Capfile', /require 'capistrano\/rbenv/i
uncomment_lines 'Capfile', /require 'capistrano\/bundler/i
uncomment_lines 'Capfile', /require 'capistrano\/capistrano3/i

template 'config/deploy.rb.tt', 'config/deploy.rb', force: true
template 'config/deploy/production.rb.tt', 'config/deploy/production.rb', force: true
template 'config/deploy/staging.rb.tt', 'config/deploy/staging.rb', force: true
