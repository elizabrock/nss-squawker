class Squeek < ActiveRecord::Base
  include ActionView::Helpers::SanitizeHelper
  include Rails.application.routes.url_helpers

  attr_accessor :ip_address

  validates_presence_of :body
  validates_presence_of :user
  mount_uploader :image, ImageUploader

  belongs_to :user
  belongs_to :user, :inverse_of => :squeeks

  before_validation :sanitize_body

  before_create :create_mentions, :lookup_location
  after_create :mention_notify

  default_scope { where("hidden is false").order(created_at: :desc) }

  def destroy
    self.hidden = true
    self.save
  end

  def viewable_by? current_user
    return true unless self.consumers_only?
    self.user.consumers.include? current_user or self.user == current_user
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

  protected

  def create_mentions
    find_mentions
    unless @mentions.empty?
      @mentions.each do |mentioned_user|
        new_string = "<a href='#{user_url(mentioned_user)}'>@#{mentioned_user.username}</a>"
        self.body = self.body.gsub(/(@#{mentioned_user.username})/i,new_string)
      end
    end
  end

  def find_mentions
    @mentions = []
    reg = /(?:@\w+)/
    mentions = self.body.scan(reg).uniq
    mentions.each do |mention|
      mention[0] = ''
      @mentions << User.find_by_username(mention.downcase)
    end
  end

  def mention_notify
    unless @mentions.empty?
      @mentions.each do |mentioned_user|
        NotificationMailer.mention_email(mentioned_user,self.user,self.body).deliver
      end
    end
  end

  def sanitize_body
    self.body = sanitize(self.body, tags: %w(a), attributes: %w(href))
  end
end
