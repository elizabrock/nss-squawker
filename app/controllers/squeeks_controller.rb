class SqueeksController < ApplicationController
  def new
  end

  def create
    flash[:notice] = "Your squeek has been posted"
    redirect_to root_path
  end
end
