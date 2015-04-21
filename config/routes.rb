# remove all comments
gsub_file('config/routes.rb', /^\s*#.*\n/, '')

# add root example
insert_into_file 'config/routes.rb', before: /^end/ do
  <<-'RUBY'
  root 'home#index'
  RUBY
end
