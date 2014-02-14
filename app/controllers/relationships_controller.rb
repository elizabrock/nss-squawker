class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:relationship][:broadcaster_id])
    @user.consume!(current_user)
    redirect_to @user
  end
end