class UsersController < ApplicationController
  def show
    @user = User.find_by username: current_user.username
  end
end
