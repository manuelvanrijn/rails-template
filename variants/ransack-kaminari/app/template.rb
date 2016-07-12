apply 'variants/ransack-kaminari/app/helpers/application_helper.rb'
apply 'variants/ransack-kaminari/app/controllers/application_controller.rb'

copy_file 'variants/ransack-kaminari/app/controllers/concerns/active_model_serializer_pagination.rb',
          'app/controllers/concerns/active_model_serializer_pagination.rb'
