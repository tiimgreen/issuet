class DashboardController < ApplicationController
  def index
    user_signed_in? ? render(:index) : redirect_to(:new_user_session)
  end
end
