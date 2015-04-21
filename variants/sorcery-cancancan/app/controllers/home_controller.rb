# require a login for the home controller
insert_into_file 'app/controllers/home_controller.rb', before: /  def index/ do
  <<-'RUBY'
  before_action :require_login

  RUBY
end
