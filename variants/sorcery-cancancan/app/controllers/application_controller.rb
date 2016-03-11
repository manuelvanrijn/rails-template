insert_into_file 'app/controllers/application_controller.rb', before: /  private/ do
  <<-'RUBY'
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to :back, alert: exception.message
  end

  RUBY
end

insert_into_file 'app/controllers/application_controller.rb', before: /^end/ do
  <<-'RUBY'

  def not_authenticated
    # don't add the alert when we just went to de root path
    return redirect_to login_path if request.path == '/'
    # else we probably were trying to access something that needs authorization
    redirect_to login_path, alert: t('user_sessions.login_first')
  end
  RUBY
end
