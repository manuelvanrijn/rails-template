template 'variants/sidekiq/config/initializers/sidekiq.rb.tt',
         'config/initializers/sidekiq.rb'

copy_file 'variants/sidekiq/config/sidekiq.yml',
          'config/sidekiq.yml'

route %(mount Sidekiq::Web => '/sidekiq' # monitoring console\n)
