# add additional Gems
insert_into_file 'Gemfile', before: 'group :development, :test do' do
  <<-'RUBY'
# variant: ransack-kaminari
gem 'ransack'
gem 'kaminari'

  RUBY
end

# add bootstrap kaminari view helpers
if apply_twitter_bootstrap?
  insert_into_file 'Gemfile', "gem 'bootstrap-kaminari-views'\n\n", after: /gem 'kaminari'\n/
end

run 'bundle install --quiet'
