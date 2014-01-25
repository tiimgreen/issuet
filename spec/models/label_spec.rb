require 'spec_helper'

describe Label do
  it { should belong_to(:project) }

  it { should belong_to(:issue) }

  it 'should have a valid factory' do
    FactoryGirl.create(:label).should be_valid
  end

  it { should validate_presence_of(:name) }

  it { should validate_uniqueness_of(:name) }

  it { should validate_presence_of(:color) }

  it { should validate_uniqueness_of(:color) }

  it 'should be able to assign a label to an issue' do
    project = FactoryGirl.create(:user).projects.create(
      name: Faker::Company.name, description: Faker::Lorem.sentence)
    issue = project.issues.create(
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph, user: project.user)
    label = project.labels.create(
      name: Faker::Lorem.word, color: 'default')
    issue << label

    expect(Project.find(project).labels).to eq([label])
    expect(Project.find(project).issues.first.labels).to eq([label])
  end

  it 'should be able to create issues with same name in different projects' do
    project1 = FactoryGirl.create(:project)
    project2 = FactoryGirl.create(:project)
    project1 << FactoryGirl.create(:issue)
    project2 << FactoryGirl.create(:issue)

    expect(project1.issues.first.labels.create(
      name: 'bug fix', color: 'default', project: project1)).to be_valid
    expect(project2.issues.first.labels.create(
      name: 'bug fix', color: 'default', project: project2)).to be_valid
    Label.all.each { |l| expect(l.name).to eq('bug fix') }
  end
end
