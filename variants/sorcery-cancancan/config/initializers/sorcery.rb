insert_into_file 'config/initializers/sorcery.rb', after: /# user.encryption_algorithm =\n/ do
  <<-RUBY
    user.encryption_algorithm = if Rails.env.test?
      # speed in for test env
      :none
    else
      :bcrypt
    end

  RUBY
end

