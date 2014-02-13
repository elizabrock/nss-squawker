class UsersController < ApplicationController
  def show
    @user = User.find_by username: "millerkatiej"
  end
end
