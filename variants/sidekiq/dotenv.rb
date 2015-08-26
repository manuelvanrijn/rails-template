insert_into_file 'example.env', before: 'SECRET_KEY_BASE=' do
  <<-'RUBY'
SIDEKIQ_WEB_USERNAME=sidekiq
SIDEKIQ_WEB_PASSWORD=
  RUBY
end
