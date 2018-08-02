# add additional Gems
insert_into_file 'Gemfile', before: 'group :development, :test do' do
  <<-RUBY
# variant: sorcery-cancancan
# release 0.12.0 didn't have ruby 5.2. support upgrade when new release is done
gem 'sorcery', github: 'Sorcery/sorcery', ref: 'cc186295b936508313887d9bcc2d3fcecc3c12ea'
gem 'cancancan', '~> 2.2.0'

  RUBY
end

run 'bundle install --quiet'
