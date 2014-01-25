FactoryGirl.define do
  factory :label do
    name { Faker::Lorem.word }
    color { 'default' }
    project { FactoryGirl.create(:project) }
    issue nil
  end
end
