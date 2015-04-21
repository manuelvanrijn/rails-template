# ask seed input
email = ask_wizard_with_default('Please input the admin emailaddress', 'admin@example.com')
pass = ask_wizard_with_default('Please input the admin password', 'testtest')

seed = "User.create! email: '#{email}', password: '#{pass}', password_confirmation: '#{pass}'"
append_to_file 'db/seeds.rb', seed
