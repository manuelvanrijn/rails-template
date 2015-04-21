run 'bundle exec cap install STAGES=staging,production'

uncomment_lines 'Capfile', /require 'capistrano\/rbenv/i
uncomment_lines 'Capfile', /require 'capistrano\/bundler/i
uncomment_lines 'Capfile', /require 'capistrano\/capistrano3/i

copy_file 'Capfile', force: true

template 'config/deploy.rb.tt', 'config/deploy.rb', force: true
template 'config/deploy/production.rb.tt', 'config/deploy/production.rb', force: true
template 'config/deploy/staging.rb.tt', 'config/deploy/staging.rb', force: true
