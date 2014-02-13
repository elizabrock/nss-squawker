class Squeek < ActiveRecord::Base
  validates_presence_of :body
  validates_presence_of :user
  mount_uploader :image, ImageUploader

  belongs_to :user
end
