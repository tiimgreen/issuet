FactoryGirl.define do
  factory :label do
    name { Faker::Lorem.word }
    color { "##{sprintf('%06x', (rand * 0xffffff))}" }
    project { FactoryGirl.create(:project) }
    issue nil
  end
end
