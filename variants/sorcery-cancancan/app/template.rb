# Controllers
copy_file 'variants/sorcery-cancancan/app/controllers/user_sessions_controller.rb',
          'app/controllers/user_sessions_controller.rb'
apply 'variants/sorcery-cancancan/app/controllers/application_controller.rb'
apply 'variants/sorcery-cancancan/app/controllers/home_controller.rb'

# Models
copy_file 'variants/sorcery-cancancan/app/models/ability.rb',
          'app/models/ability.rb', force: true

copy_file 'variants/sorcery-cancancan/app/models/user.rb',
          'app/models/user.rb', force: true

# Views
copy_file 'variants/sorcery-cancancan/app/views/user_sessions/new.html.haml',
          'app/views/user_sessions/new.html.haml'
apply 'variants/sorcery-cancancan/app/views/layouts/application.html.haml.rb'
