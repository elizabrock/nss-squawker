class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:relationship][:broadcaster_id])
    current_user.consume!(@user)
    redirect_to @user
  end
end