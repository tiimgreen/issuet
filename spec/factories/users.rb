FactoryGirl.define do
  factory :user do
    password = Faker::Internet.password

    name { Faker::Name.name }
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password password
    password_confirmation password
  end
end
