insert_into_file 'spec/rails_helper.rb', after: "add_group 'Decorators', 'app/decorators'\n" do
  <<-'RUBY'
  add_group 'Jobs', 'app/jobs'
  RUBY
end
