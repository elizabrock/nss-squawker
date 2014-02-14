class Squeek < ActiveRecord::Base
  validates_presence_of :body
  validates_presence_of :user

  belongs_to :user

  default_scope { where("hidden is false") }

  def destroy
    self.hidden = true
    self.save
  end
end