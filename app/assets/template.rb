gsub_file 'app/assets/javascripts/application.js',
          '//= require turbolinks', ''

copy_file 'app/assets/stylesheets/_components.sass'
