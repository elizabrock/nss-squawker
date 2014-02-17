class Squeek < ActiveRecord::Base
  attr_accessor :ip_address

  validates_presence_of :body
  validates_presence_of :user

  belongs_to :user

  before_create :lookup_location

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
