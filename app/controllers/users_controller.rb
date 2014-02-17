class UsersController < ApplicationController
  def show
    # @user = User.find_by username: current_user.username
    @user = User.find_by_id(params[:id])
    # @user = User.find_by(params[:username])
  end
end
