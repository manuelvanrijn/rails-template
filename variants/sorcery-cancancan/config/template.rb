apply 'variants/sorcery-cancancan/config/locales/nl.rb'
apply 'variants/sorcery-cancancan/config/locales/en.rb'

# add routes for login
insert_into_file 'config/routes.rb', after: "Rails.application.routes.draw do\n" do
  <<-'RUBY'
  get 'login' => 'user_sessions#new', as: :login
  post 'login' => 'user_sessions#create'
  post 'logout' => 'user_sessions#destroy', as: :logout

  RUBY
end
