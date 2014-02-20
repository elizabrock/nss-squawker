class UsersController < ApplicationController
  def show
    @user = User.find_by_username(params[:id])
    @consumers = @user.consumers
    @broadcasters = @user.broadcasters
  end
end
