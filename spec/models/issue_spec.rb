require 'spec_helper'

describe Issue do
  it { should belong_to(:user) }

  it { should belong_to(:project) }

  it 'should have a valid factory' do
    FactoryGirl.create(:issue).should be_valid
  end

  it { should validate_presence_of(:title) }

  it { should validate_uniqueness_of(:title) }

  it { should validate_presence_of(:body) }

  it { should allow_value('open', 'closed').for(:state) }

  it { should_not allow_value('opened', 'close').for(:state) }

  it 'should require state to be "open" by default' do
    FactoryGirl.build(:issue).state.should == 'open'
  end

  it { should validate_presence_of(:user) }

  it { should validate_presence_of(:project) }

  it 'should increment the number attribute within a project' do
    project1 = FactoryGirl.create(:project)
    project2 = FactoryGirl.create(:project)

    project1 << FactoryGirl.create(:issue, project: project1)
    project1 << FactoryGirl.create(:issue, project: project1)
    project2 << FactoryGirl.create(:issue, project: project2)
    project2 << FactoryGirl.create(:issue, project: project2)

    expect(project1.issues.first.number).to eq(1)
    expect(project1.issues.last.number).to eq(2)

    expect(project2.issues.first.number).to eq(1)
    expect(project2.issues.last.number).to eq(2)
  end
end
