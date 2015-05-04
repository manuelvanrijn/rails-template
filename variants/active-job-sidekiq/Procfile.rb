insert_into_file 'Procfile', after: "web:         bundle exec rails s\n" do
  <<-'RUBY'
redis:       redis-server
sidekiq:     bundle exec sidekiq
  RUBY
end
