require 'spec_helper'

describe User do
  it { should have_many(:issues) }

  it 'should have a valid factory' do
    FactoryGirl.create(:user).should be_valid
  end

  it { should validate_presence_of(:username) }

  it { should validate_presence_of(:email) }

  it { should validate_presence_of(:password) }

  it { should allow_value('hi@rafalchmiel.com').for(:email) }

  it { should_not allow_value('rafalchmiel').for(:email) }

  it { should validate_uniqueness_of(:username) }

  it { should validate_uniqueness_of(:email) }
end
