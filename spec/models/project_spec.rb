require 'spec_helper'

describe Project do
  it { should belong_to(:user) }

  it { should have_many(:issues) }

  it 'should have a valid factory' do
    FactoryGirl.create(:project).should be_valid
  end

  it { should validate_presence_of(:name) }

  it { should validate_uniqueness_of(:name) }

  it { should validate_presence_of(:user) }

  it 'should be able to create a new issue within a project' do
    project = FactoryGirl.create(:user).projects.create(
      name: Faker::Company.name, description: Faker::Lorem.sentence)
    issue = project.issues.create(
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph, user: project.user)

    expect(Project.find(project).issues).to eq([issue])
  end
end
