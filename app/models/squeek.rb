require 'sanitize'

class Squeek < ActiveRecord::Base
  validates_presence_of :body
  validates_presence_of :user

  belongs_to :user

  before_create :sanitize_body, :create_mentions
  after_create :mention_notify

  protected
    def create_mentions
      find_mentions
      unless @mentions.empty?
        @mentions.each do |mentioned_user|
          new_string = "<a href='/users/#{mentioned_user.id}'>@#{mentioned_user.username}</a>"
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
      self.body = Sanitize.clean(self.body, :elements => ['a'], :attributes => {'a' => ['href']})
    end
end
