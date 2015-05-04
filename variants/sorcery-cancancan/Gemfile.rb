# add additional Gems
insert_into_file 'Gemfile', before: 'group :development, :test do' do
  <<-'RUBY'
# variant: sorcery-cancancan
gem 'sorcery'
gem 'cancancan', '~> 1.10'

  RUBY
end

run 'bundle install --quiet'
