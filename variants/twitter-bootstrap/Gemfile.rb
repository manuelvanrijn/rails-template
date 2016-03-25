# add additional Gems
insert_into_file 'Gemfile', before: 'group :development, :test do' do
  <<-'RUBY'
# variant: twitter-bootstrap
gem 'bootstrap-sass', '~> 3.3.1'
gem 'autoprefixer-rails'
gem 'bootstrap_form'
gem 'active_link_to'

  RUBY
end

run 'bundle install --quiet'
