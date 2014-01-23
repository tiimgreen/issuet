FactoryGirl.define do
  factory :project do
    name { Faker::Company.name }
    description { Faker::Lorem.sentence }
    user { FactoryGirl.create(:user) }
  end
end
