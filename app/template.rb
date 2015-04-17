apply 'app/assets/template.rb'
apply 'app/controllers/application_controller.rb'

remove_file 'app/views/layouts/application.html.erb'
template 'app/views/layouts/application.html.haml.tt', 'app/views/layouts/application.html.haml'
