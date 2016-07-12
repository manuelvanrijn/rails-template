seed = "User.create! email: 'admin@example.com', password: 'testtest', password_confirmation: 'testtest'"
append_to_file 'db/seeds.rb', seed
