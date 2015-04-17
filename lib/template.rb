copy_file 'lib/extensions/draper_decorator_ext.rb'

# Beter scaffold templates
%w(_form edit index new show).each do |view|
  copy_file "lib/templates/haml/scaffold/#{view}.html.haml"
end

copy_file 'lib/templates/rails/scaffold_controller/controller.rb'
