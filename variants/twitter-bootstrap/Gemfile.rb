# add additional Gems
insert_into_file 'Gemfile', before: 'group :development, :test do' do
  <<-RUBY
# variant: twitter-bootstrap
gem 'bootstrap-sass', '~> 3.3'
gem 'autoprefixer-rails', '~> 6.3'
gem 'bootstrap_form', '~> 2.4'
gem 'active_link_to', '~> 1.0'

  RUBY
end

run 'bundle install --quiet'
