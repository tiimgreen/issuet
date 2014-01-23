FactoryGirl.define do
  factory :issue do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    user { FactoryGirl.create(:user) }
    project { FactoryGirl.create(:project) }
  end
end
