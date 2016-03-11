insert_into_file 'spec/rails_helper.rb', after: "ENV['RAILS_ENV'] ||= 'test'\n" do
  <<-'RUBY'

require 'simplecov'
SimpleCov.start 'rails' do
  add_group 'Decorators', 'app/decorators'
  add_group 'Rake tasks', 'lib/tasks'
  add_group 'Serializers', 'app/serializers'

  # ignored
  add_filter '/lib/templates/rails'
end

  RUBY
end

insert_into_file 'spec/rails_helper.rb', after: "require 'rspec/rails'\n" do
  <<-'RUBY'

if ENV['CI']
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::Console,
  ]
end

  RUBY
end
