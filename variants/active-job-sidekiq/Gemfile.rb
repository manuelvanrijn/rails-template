# add additional Gems
insert_into_file 'Gemfile', before: 'group :development, :test do' do
  <<-'RUBY'
# variant: active-job-sidekiq
gem 'sidekiq', '~> 3.3.0'
gem 'sinatra', '>= 1.3.0', require: false

  RUBY
end

run 'bundle install --quiet'
