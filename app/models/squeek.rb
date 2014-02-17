class Squeek < ActiveRecord::Base
  attr_accessor :ip_address

  validates_presence_of :body
  validates_presence_of :user
  mount_uploader :image, ImageUploader

  belongs_to :user

  before_create :lookup_location

  default_scope { where("hidden is false") }

  def destroy
    self.hidden = true
    self.save
  end

  private

  def lookup_location
    result = Geocoder.search(ip_address)[0]
    if result.present? and !result.city.blank?
      self.location = [result.city, result.state].join(", ")
    else
      self.location = "Unknown Location"
    end
  end
end
