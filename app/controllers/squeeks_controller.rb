class SqueeksController < ApplicationController
  def index
    @squeeks = Squeek.all
  end

  def new
    @squeek = Squeek.new
  end

  def create
    squeek_params = params.require(:squeek).permit(:body)
    @squeek = Squeek.new(squeek_params)
    if @squeek.save
      flash[:notice] = "Your squeek has been posted"
      redirect_to squeeks_path
    else
      flash[:alert] = "Your squeek couldn't be posted. #{@squeek.errors.full_messages.join(" ")}"
      render :new
    end
  end
end
