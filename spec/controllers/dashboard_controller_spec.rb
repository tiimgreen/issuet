require 'spec_helper'

describe DashboardController do
  describe 'GET #index' do
    context 'when user signed in' do
      login_user!

      it 'should render the "index" template' do
        get :index
        expect(response).to render_template('index')
      end
    end

    context 'when user not signed in' do
      it 'should redirect to the sign in view' do
        get :index
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end
end
