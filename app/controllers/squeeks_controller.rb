class SqueeksController < ApplicationController
  before_filter :load_squeeks
  autocomplete :user, :username, :full => true

  def index
    @squeek = Squeek.new
  end

  def create
    squeek_params = params.require(:squeek).permit(:body, :image, :consumers_only)
    @squeek = current_user.squeeks.new(squeek_params)
    @squeek.ip_address = request.remote_ip
    if @squeek.save
      flash[:notice] = "Your squeek has been posted"
      redirect_to squeeks_path
    else
      flash[:alert] = "Your squeek couldn't be posted. #{@squeek.errors.full_messages.join(" ")}"
      render :index
    end
  end

  def destroy
    squeek = Squeek.find(params[:id])
    squeek.destroy
    flash[:alert] = "Your squeek has been deleted"
    redirect_to :back
  end

  private

  def load_squeeks
    @squeeks = Squeek.page params[:page]
  end
end
