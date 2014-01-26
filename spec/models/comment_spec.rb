require 'spec_helper'

describe Comment do
  it { should belong_to(:user) }

  it { should belong_to(:issue) }

  it 'should have a valid factory' do
    FactoryGirl.create(:comment).should be_valid
  end

  it { should validate_presence_of(:body) }

  it { should validate_presence_of(:user) }

  it { should validate_presence_of(:issue) }

  it 'should allow issues to be commented on' do
    user = FactoryGirl.create(:user)
    project = FactoryGirl.create(:project)
    issue = FactoryGirl.create(:issue, user: user, project: project)
    comment = issue.comments.create(body: '+1', user: user, issue: issue)

    expect(comment).to be_valid
    expect(issue.comments).to eq([comment])
    expect(user.comments).to eq([comment])
  end
end
