append_to_file 'config/locales/en.yml' do
  <<-'RUBY'

  user_sessions:
    title: Login
    login: Sign-in
    logout: Logout
    email: Email address
    password: Password
    login_created: You need to be signed in
    login_failed: Failed to sign in
    login_destroyed: Logged out successfully
    login_first: You have to be logged in to see this page

  unauthorized:
    manage:
      all: You do not have access to this page
  RUBY
end
