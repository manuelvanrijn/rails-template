# add additional Gems
insert_into_file 'Gemfile', before: 'group :development, :test do' do
  <<-'RUBY'
# variant: ransack-kaminari
gem 'ransack', git: 'https://github.com/activerecord-hackery/ransack.git', branch: 'master'
gem 'kaminari', '~> 0.17.0'

  RUBY
end

# add bootstrap kaminari view helpers
if apply_twitter_bootstrap?
  insert_into_file 'Gemfile', "gem 'bootstrap-kaminari-views', '~> 0.0.5'\n\n", after: /gem 'kaminari', '~> 0.17.0'\n/
end

run 'bundle install --quiet'
