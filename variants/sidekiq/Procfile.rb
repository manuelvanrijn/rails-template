append_to_file 'Procfile' do
  <<-RUBY
sidekiq:     bundle exec sidekiq -C config/sidekiq.yml
  RUBY
end
