class SqueeksController < ApplicationController
  before_filter :load_squeeks

  def index
    @squeek = Squeek.new
  end

  def create
    squeek_params = params.require(:squeek).permit(:body, :image)
    @squeek = current_user.squeeks.new(squeek_params)
    puts @squeek.image
    if @squeek.save
      flash[:notice] = "Your squeek has been posted"
      redirect_to squeeks_path
    elsif @squeek.errors.full_messages.join(" ").include? "You are not allowed to upload"
      flash[:alert] = "Please choose a JPG, JPEG or PNG file"
      redirect_to squeeks_path
    else
      flash[:alert] = "Your squeek couldn't be posted. #{@squeek.errors.full_messages.join(" ")}"
      render :index
    end
  end

  private

  def load_squeeks
    @squeeks = Squeek.page params[:page]
  end
end
