insert_into_file 'app/controllers/application_controller.rb', before: /  private/ do
  <<-'RUBY'
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to login_path, alert: exception.message
  end

  RUBY
end

insert_into_file 'app/controllers/application_controller.rb', before: /^end/ do
  <<-'RUBY'

  def not_authenticated
    redirect_to login_path, alert: t('user_sessions.login_first')
  end
  RUBY
end
