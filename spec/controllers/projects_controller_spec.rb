require 'spec_helper'

describe ProjectsController do
  describe 'GET #index' do
    context 'when user signed in' do
      login_user!

      it 'should redirect to the Dashboard' do
        get :index
        expect(response).to redirect_to('/')
      end
    end

    context 'when user not signed in' do
      it 'should redirect to the sign in view' do
        get :index
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end

  describe 'GET #new' do
    context 'when user signed in' do
      login_user!

      it 'should render the "new" template' do
        get :new
        expect(response).to render_template('new')
      end
    end

    context 'when user not signed in' do
      it 'should redirect to the sign in view' do
        get :new
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end

  describe 'POST #create' do
    context 'when user signed in' do
      login_user!

      it 'should redirect to the newly created project path' do
        project_name = Faker::Lorem.word
        post :create, project: {
          name: project_name,
          description: Faker::Lorem.sentence
        }
        expect(response).to redirect_to("/projects/#{project_name}")
      end
    end

    context 'when user not signed in' do
      it 'should redirect to the sign in view' do
        get :new
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end

  describe 'GET #show' do
    context 'when user signed in' do
      create_project_for_user!

      it 'should render the "show" template' do
        get :show, id: project
        expect(response).to render_template('show')
      end
    end

    context 'when user not signed in' do
      it 'should redirect to the sign in view' do
        get :show, id: 'issuet'
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end

  describe 'GET #edit' do
    context 'when user signed in' do
      create_project_for_user!

      context 'when owner of project' do
        it 'should render the "edit" template' do
          get :edit, id: project
          expect(response).to render_template('edit')
        end
      end

      context 'when not owner of project' do
        login_user!

        it 'should redirect to the project path' do
          get :edit, id: project
          expect(response).to redirect_to("/projects/#{project.name}")
        end
      end
    end

    context 'when user not signed in' do
      it 'should redirect to the sign in view' do
        get :edit, id: 'issuet'
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end

  # TODO write specs for PATCH #update
  describe 'PATCH #update'

  describe 'DELETE #destroy' do
    context 'when user signed in' do
      create_project_for_user!

      context 'when owner of project' do
        it 'should redirect to the Dashboard' do
          delete :destroy, id: project
          expect(response).to redirect_to('/')
        end
      end

      context 'when not owner of project' do
        login_user!

        it 'should redirect to the project path' do
          delete :destroy, id: project
          expect(response).to redirect_to("/projects/#{project.name}")
        end
      end
    end

    context 'when user not signed in' do
      it 'should redirect to the sign in view' do
        delete :destroy, id: 'issuet'
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end
end
