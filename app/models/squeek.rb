class Squeek < ActiveRecord::Base
  validates_presence_of :body
  validates_presence_of :user

  belongs_to :user

  attr_reader :user_username
end
