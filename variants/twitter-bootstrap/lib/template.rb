# Beter simple_form scaffold templates
scaffold_path = 'variants/twitter-bootstrap/lib/templates/haml/scaffold'

%w(_form edit index new show).each do |view|
  copy_file "#{scaffold_path}/#{view}.html.haml",
            "lib/templates/haml/scaffold/#{view}.html.haml", force: true
end
