# Beter scaffold views
%w(_form edit index new show).each do |view|
  copy_file "lib/templates/haml/scaffold/#{view}.html.haml"
end

# Beter scaffold controller
copy_file 'lib/templates/rails/scaffold_controller/controller.rb'
