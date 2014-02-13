class Squeek < ActiveRecord::Base
  validates_presence_of :body
  validates_presence_of :user

  belongs_to :user

  after_validation :save_mentions, on: :create

  protected
    def save_mentions
      if has_mentions
        @mentions.each do |mention|
          mention[0] = ''
          mentioned_user = User.where(username: mention.downcase).first
          if mentioned_user
            new_string = "<a href='/users/#{mentioned_user.id}'>@#{mention}</a>"
            self.body = self.body.gsub("@#{mention}",new_string)
            mention_notify(mentioned_user)
          end
        end
      end
    end

    def has_mentions
      reg = /(?:@\w+)/
      mentions = self.body.scan(reg).uniq
      if mentions.length > 0
        @mentions = mentions
        true
      else
        false
      end
    end

    def mention_notify mentioned_user
      NotificationMailer.mention_email(mentioned_user,self.user,self.body).deliver
    end
end
