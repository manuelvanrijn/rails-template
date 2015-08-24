generate 'bower_rails:initialize'

uncomment_lines 'config/initializers/bower_rails.rb', /bower_rails.install_before_precompile/i
uncomment_lines 'config/initializers/bower_rails.rb', /bower_rails.use_bower_install_deployment/i
