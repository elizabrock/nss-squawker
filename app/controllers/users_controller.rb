class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
    @consumers = @user.consumers
    @broadcasters = @user.broadcasters
  end

end
