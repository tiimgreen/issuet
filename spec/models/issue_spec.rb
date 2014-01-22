require 'spec_helper'

describe Issue do
  it { should belong_to(:user) }

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
end
