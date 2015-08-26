# add additional Gems
insert_into_file 'Gemfile', before: 'group :development, :test do' do
  <<-'RUBY'
# variant: sidekiq
gem 'rspec-sidekiq', group: :test
gem 'sidekiq', '~> 3.4.2'
gem 'sidekiq-statistic'
gem 'sinatra', '>= 1.3.0', require: false

  RUBY
end

run 'bundle install --quiet'
