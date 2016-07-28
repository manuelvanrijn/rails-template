copy_file 'variants/default/harrow_git_config', 'harrow_git_config'
run 'GIT_CONFIG=harrow_git_config bundle exec cap install STAGES=staging,production'
remove_file 'harrow_git_config'

copy_file 'Capfile', force: true

template 'config/deploy.rb.tt', 'config/deploy.rb', force: true
template 'config/deploy/production.rb.tt', 'config/deploy/production.rb', force: true
template 'config/deploy/staging.rb.tt', 'config/deploy/staging.rb', force: true
