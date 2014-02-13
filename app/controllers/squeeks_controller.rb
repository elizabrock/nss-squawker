class SqueeksController < ApplicationController
  before_filter :load_squeeks
  before_filter :get_location, :only => [:create]

  def index
    @squeek = Squeek.new
  end

  def create
    squeek_params = params.require(:squeek).permit(:body)
    squeek_params.merge!(:location => @city_state_string)
    @squeek = current_user.squeeks.new(squeek_params)
    if @squeek.save
      flash[:notice] = "Your squeek has been posted"
      redirect_to squeeks_path
    else
      flash[:alert] = "Your squeek couldn't be posted. #{@squeek.errors.full_messages.join(" ")}"
      render :index
    end
  end

  def get_location
    ip_address = request.remote_ip
    ip_address = "160.36.179.25"
    result = Geocoder.search(ip_address)
    @city_state_string = result[0].city + ", " + result[0].state
  end

  private

  def load_squeeks
    @squeeks = Squeek.all
  end
end
