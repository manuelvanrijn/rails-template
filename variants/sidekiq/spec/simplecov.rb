insert_into_file 'spec/rails_helper.rb', after: "add_group 'Decorators', 'app/decorators'\n" do
  <<-'RUBY'
  add_group 'Workers', 'app/workers'
  RUBY
end
