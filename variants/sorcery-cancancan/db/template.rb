#FIXME: ask during generation?
append_to_file 'db/seeds.rb' do
  <<-'RUBY'
User.create! email: 'admin@example.com', password: 'testtest', password_confirmation: 'testtest'
  RUBY
end
