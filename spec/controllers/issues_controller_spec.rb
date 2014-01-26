require 'spec_helper'

describe IssuesController do
  before(:each) { @project = FactoryGirl.build(:project) }

  describe 'GET #index' do
    context 'when user signed in' do
      login_user!

      it 'should redirect to the Project show view' do
        get :index, project_id: @project.name
        expect(response).to redirect_to("/projects/#{@project.name}")
      end
    end

    context 'when user not signed in' do
      it 'should redirect to the sign in view' do
        get :index, project_id: @project.name
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end

  describe 'GET #new' do
    context 'when user signed in' do
      login_user!

      it 'should render the "new" template' do
        get :new, project_id: @project.name
        expect(response).to render_template('new')
      end
    end

    context 'when user not signed in' do
      it 'should redirect to the sign in view' do
        get :new, project_id: @project.name
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end
end
