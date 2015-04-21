FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "rspec_user#{n}@example.tld" }
    password 'password'
    password_confirmation 'password'
  end
end
