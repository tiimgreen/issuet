require 'spec_helper'

describe UsersController do
  describe 'GET #show' do
    context 'when user signed in' do
      login_user!

      it 'should render the "show" template' do
        get :show, username: 'rafalchmiel'
        expect(response).to render_template('show')
      end
    end

    context 'when user not signed in' do
      it 'should redirect to the sign in view' do
        get :show, username: 'rafalchmiel'
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end
end
