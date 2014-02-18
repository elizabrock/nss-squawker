class Relationship < ActiveRecord::Base
  belongs_to :broadcaster, class_name: "User"
  belongs_to :consumer, class_name: "User"
  validates :broadcaster_id, presence: true
  validates :consumer_id, presence: true
end
