class Squeek < ActiveRecord::Base
  validates_presence_of :body
  validates_presence_of :user

  belongs_to :user, :inverse_of => :squeeks

  def viewable_by? current_user
    return true unless self.consumers_only?
    self.user.consumers.include? current_user or self.user == current_user
  end

end
