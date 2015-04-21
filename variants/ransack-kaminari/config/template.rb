copy_file 'variants/ransack-kaminari/config/locales/nl.kaminari.yml',
          'config/locales/nl.kaminari.yml'
copy_file 'variants/ransack-kaminari/config/locales/en.kaminari.yml',
          'config/locales/en.kaminari.yml'

# fixes issues with draper and kaminari's magic methods
copy_file 'variants/ransack-kaminari/config/initializers/draper.rb',
          'config/initializers/draper.rb'
