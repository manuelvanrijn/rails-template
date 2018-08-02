# add additional Gems
insert_into_file 'Gemfile', before: 'group :development, :test do' do
  <<-RUBY
# variant: twitter-bootstrap
gem 'bootstrap-sass', '~> 3.3.7'
gem 'autoprefixer-rails', '~> 7.2.4'
gem 'bootstrap_form', '~> 2.7'
gem 'nested_form', '~> 0.3.2'
gem 'active_link_to', '~> 1.0.5'

  RUBY
end

run 'bundle install --quiet'
