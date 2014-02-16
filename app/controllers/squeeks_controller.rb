class SqueeksController < ApplicationController
  before_filter :load_squeeks

  def index
    @squeek = Squeek.new
  end

  def create
    squeek_params = params.require(:squeek).permit(:body)
    @squeek = current_user.squeeks.new(squeek_params)
    @squeek.location = get_location
    if @squeek.save
      flash[:notice] = "Your squeek has been posted"
      redirect_to squeeks_path
    else
      flash[:alert] = "Your squeek couldn't be posted. #{@squeek.errors.full_messages.join(" ")}"
      render :index
    end
  end

  private

  def get_location
    ip_address = request.remote_ip
    result = Geocoder.search(ip_address)[0]
    if result.present? and !result.city.blank?
      [result.city, result.state].join(", ")
    else
      "Unknown Location"
    end
  end


  def load_squeeks
    @squeeks = Squeek.all
  end
end
