require 'spec_helper'

describe User do
  it 'should have a valid factory' do
    FactoryGirl.create(:user).should be_valid
  end

  it 'should require a username' do
    FactoryGirl.build(:user, username: nil).should_not be_valid
  end

  it 'should require an email' do
    FactoryGirl.build(:user, email: nil).should_not be_valid
  end

  it 'should require a password and confirmation' do
    FactoryGirl.build(
      :user, password: nil, password_confirmation: nil).should_not be_valid
  end

  it 'should require email to match email address format' do
    FactoryGirl.build(:user, email: 'rafalchmiel').should_not be_valid
    FactoryGirl.build(:user, email: 'hi@rafalchmiel.com').should be_valid
  end

  it 'should not allow duplicate usernames' do
    FactoryGirl.create(:user, username: 'rafalchmiel')
    FactoryGirl.build(:user, username: 'rafalchmiel').should_not be_valid
  end

  it 'should not allow duplicate emails' do
    FactoryGirl.create(:user, email: 'hi@rafalchmiel.com')
    FactoryGirl.build(:user, email: 'hi@rafalchmiel.com').should_not be_valid
  end
end
