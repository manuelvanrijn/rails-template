# add additional Gems
insert_into_file 'Gemfile', before: 'group :development, :test do' do
  <<-'RUBY'
# variant: twitter-bootstrap
gem 'bootstrap-sass', '~> 3.3.1'
gem 'autoprefixer-rails'
gem 'bootstrap_form'

  RUBY
end

run 'bundle install --quiet'
