# add additional Gems
insert_into_file 'Gemfile', before: 'group :development, :test do' do
  <<-'RUBY'
# variant: sidekiq
gem 'rspec-sidekiq', '~> 2.2', group: :test
gem 'sidekiq', '~> 4.1.2'
gem 'sidekiq-statistic', '~> 1.2'
# at this point the commit is used because of the conflict with rack
gem 'sinatra', git: 'https://github.com/sinatra/sinatra.git', ref: 'e7ef8e234fd36e389ec7e23d562de488fde7abff'

  RUBY
end

run 'bundle install --quiet'
