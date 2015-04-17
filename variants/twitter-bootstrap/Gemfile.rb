# add additional Gems
insert_into_file 'Gemfile', before: 'group :development, :test do' do
  <<-'RUBY'
# variant: twitter-bootstrap
gem 'bootstrap-sass', '~> 3.3.1'
gem 'autoprefixer-rails'
gem 'font-awesome-rails'
# gem 'simple_form'
gem 'bootstrap_form'

gem 'bootstrap-kaminari-views'

  RUBY
end
