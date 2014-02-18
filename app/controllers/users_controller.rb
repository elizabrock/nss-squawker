class UsersController < ApplicationController
  def show
    @user = User.find_by_username(params[:id])
    # @user = User.find_by username params[:id]
    # @user = User.find_by_id(params[:id])
  end
end


