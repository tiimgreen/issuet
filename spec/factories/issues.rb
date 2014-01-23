FactoryGirl.define do
  factory :issue do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
  end
end
