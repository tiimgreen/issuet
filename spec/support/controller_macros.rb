module ControllerMacros
  def login_user!
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_out :user
      sign_in FactoryGirl.create(:user)
    end
  end

  def create_project_for_user!
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      @user = FactoryGirl.create(:user)
      @user.projects.create(
        name: Faker::Lorem.word, description: Faker::Lorem.sentence)
      sign_in user
    end

    let(:user) { @user }
    let(:project) { @user.projects.first }
  end
end
