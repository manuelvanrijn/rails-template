template 'variants/active-job-sidekiq/config/initializers/sidekiq.rb.tt',
         'config/initializers/sidekiq.rb'
copy_file 'variants/active-job-sidekiq/config/initializers/active_job.rb',
          'config/initializers/active_job.rb'

copy_file 'variants/active-job-sidekiq/config/sidekiq.yml',
          'config/sidekiq.yml'

route %(mount Sidekiq::Web => '/sidekiq' # monitoring console\n)
