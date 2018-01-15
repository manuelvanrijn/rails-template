# add additional Gems
insert_into_file 'Gemfile', before: 'group :development, :test do' do
  <<-RUBY
# variant: sorcery-cancancan
gem 'sorcery', '~> 0.11.0'
gem 'cancancan', '~> 2.1.2'

  RUBY
end

run 'bundle install --quiet'
