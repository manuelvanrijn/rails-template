# add additional Gems
insert_into_file 'Gemfile', before: 'group :development, :test do' do
  <<-RUBY
# variant: sorcery-cancancan
gem 'sorcery', '~> 0.10.3'
gem 'cancancan', '~> 1.15'

  RUBY
end

run 'bundle install --quiet'
