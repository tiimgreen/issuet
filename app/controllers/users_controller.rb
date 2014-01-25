class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find_by_username(params[:username])
  end
end
