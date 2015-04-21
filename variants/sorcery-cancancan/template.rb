apply 'variants/sorcery-cancancan/Gemfile.rb'

generate 'cancan:ability'
generate 'sorcery:install'

apply 'variants/sorcery-cancancan/app/template.rb'
apply 'variants/sorcery-cancancan/config/template.rb'
apply 'variants/sorcery-cancancan/db/template.rb'
apply 'variants/sorcery-cancancan/lib/template.rb'
apply 'variants/sorcery-cancancan/spec/template.rb'
