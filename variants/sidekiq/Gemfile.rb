# add additional Gems
insert_into_file 'Gemfile', before: 'group :development, :test do' do
  <<-RUBY
# variant: sidekiq
gem 'rspec-sidekiq', '~> 3.0.3', group: :test
gem 'sidekiq', '~> 5.1.3'
gem 'sidekiq-statistic', git: 'https://github.com/davydovanton/sidekiq-statistic.git', ref: 'f7476c9a9ab30a1988ae4127e256c63f38f782e1'

  RUBY
end

run 'bundle install --quiet'
