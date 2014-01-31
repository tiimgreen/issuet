class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find_by(username: params[:username])
  end
end
