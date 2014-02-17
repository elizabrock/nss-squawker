class SqueeksController < ApplicationController
  before_filter :load_squeeks
  autocomplete :user, :username, :full => true

  def index
    @squeek = Squeek.new
  end

  def create
    squeek_params = params.require(:squeek).permit(:body)
    @squeek = current_user.squeeks.new(squeek_params)
    if @squeek.save
      flash[:notice] = "Your squeek has been posted"
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
