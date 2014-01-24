FactoryGirl.define do
  factory :project do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    user { FactoryGirl.create(:user) }
  end
end
