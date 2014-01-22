FactoryGirl.define do
  factory :issue do |issue|
    issue.title { Faker::Lorem.sentence }
    issue.body { Faker::Lorem.paragraph }
    issue.state 'open'
  end
end
