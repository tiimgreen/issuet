require 'spec_helper'

describe User do
  it { should have_many(:issues) }

  it { should have_many(:projects) }

  it 'should have a valid factory' do
    FactoryGirl.create(:user).should be_valid
  end

  it { should validate_presence_of(:username) }

  it { should validate_presence_of(:email) }

  it { should validate_presence_of(:password) }

  it { should validate_presence_of(:name) }

  it { should allow_value(Faker::Internet.email).for(:email) }

  it { should_not allow_value(Faker::Internet.user_name).for(:email) }

  it { should validate_uniqueness_of(:username) }

  it { should validate_uniqueness_of(:email) }

  it 'should be able to create a new project' do
    user = FactoryGirl.create(:user)
    project = user.projects.create(
      name: Faker::Company.name, description: Faker::Lorem.sentence)

    expect(User.find(user).projects).to eq([project])
  end
end
