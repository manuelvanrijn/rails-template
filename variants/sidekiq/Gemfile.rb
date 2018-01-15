# add additional Gems
insert_into_file 'Gemfile', before: 'group :development, :test do' do
  <<-RUBY
# variant: sidekiq
gem 'rspec-sidekiq', '~> 3.0.3', group: :test
gem 'sidekiq', '~> 5.0.5'
gem 'sidekiq-statistic', git: 'https://github.com/davydovanton/sidekiq-statistic.git', ref: '70e02c75438b15157b5b79364876741ffdcac5c8'

  RUBY
end

run 'bundle install --quiet'
