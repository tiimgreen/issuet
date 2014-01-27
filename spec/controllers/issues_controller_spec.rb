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

  describe 'POST #create' do
    before(:each) do
      @project = FactoryGirl.create(:project)
    end

    context 'when user signed in' do
      login_user!

      it 'should redirect to the newly created project path' do
        issue = FactoryGirl.build(:issue)
        post :create, project_id: @project.name, issue: {
          title: issue.title,
          body: issue.body
        }
        expect(response).to redirect_to("/projects/#{@project.name}/issues")
      end
    end

    context 'when user not signed in' do
      it 'should redirect to the sign in view' do
        get :new, project_id: @project.name
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end

  describe 'GET #show' do
    before(:each) do
      @project = FactoryGirl.create(:project)
      FactoryGirl.create(:issue, project: @project)
      @first_issue = @project.issues.first
    end

    context 'when user signed in' do
      login_user!

      it 'should render the "show" template' do
        get :show, project_id: @project.name, id: @first_issue
        expect(response).to render_template('show')
      end
    end

    context 'when user not signed in' do
      it 'should redirect to the sign in view' do
        get :show, project_id: @project.name, id: @first_issue
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end
end
