class FavoritesController < ApplicationController
  def create
    squeek = Squeek.find_by_id(params[:squeek_id])
    Favorite.create!(user: current_user, squeek: squeek)
    flash[:notice] = "You have favorited #{squeek.user.username}'s squeek: \"#{squeek.body}\""
    redirect_to :root
  end
end
