FactoryGirl.define do
  factory :comment do
    body { Faker::Lorem.paragraph }
    user { FactoryGirl.create(:user) }
    issue { FactoryGirl.create(:issue) }
  end
end
