# Beter simple_form scaffold templates
copy_file 'variants/sorcery-cancancan/lib/templates/rails/controller/controller.rb',
          'lib/templates/rails/controller/controller.rb'
copy_file 'variants/sorcery-cancancan/lib/templates/rails/scaffold_controller/controller.rb',
          'lib/templates/rails/scaffold_controller/controller.rb', force: true
