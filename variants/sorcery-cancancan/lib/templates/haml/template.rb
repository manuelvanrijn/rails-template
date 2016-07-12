# Beter simple_form scaffold templates
scaffold_path = 'variants/sorcery-cancancan/lib/templates/haml/scaffold'

%w(index show).each do |view|
  copy_file "#{scaffold_path}/#{view}.html.haml",
            "lib/templates/haml/scaffold/#{view}.html.haml", force: true
end
