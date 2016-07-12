apply 'app/assets/template.rb'

remove_file 'app/views/layouts/application.html.erb'
template 'app/views/layouts/application.html.haml.tt',
         'app/views/layouts/application.html.haml'

copy_file 'app/controllers/home_controller.rb'
copy_file 'app/controllers/concerns/lograge_payload.rb'
copy_file 'app/controllers/concerns/decorate_instance_variables.rb'

copy_file 'app/views/home/index.html.haml', force: true

apply 'app/controllers/application_controller.rb'
