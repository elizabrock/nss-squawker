class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:twitter]

  has_many :squeeks

  def self.find_for_database_authentication(conditions)
    self.where(:username => conditions[:email]).first || self.where(:email => conditions[:email]).first
  end

  def self.find_for_twitter_oauth(auth)
    p auth.info
    where(auth.slice(:provider, :uid)).first_or_create do |user|
        p "CREATING USER FROM TWITTER"
        p "@#{auth.info.nickname}"
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = "pete@gmail.com"
        user.password = Devise.friendly_token[0,20]
        #user.name = auth.info.name   # assuming the user model has a name
        #user.image = auth.info.image # assuming the user model has an image
    end
  end

  # def self.new_with_session(params, session)
  #   super.tap do |user|
  #     if data = session["devise.twitter_data"] && session["devise.twitter_data"]["extra"]["raw_info"]
  #       user.email = data["email"] if user.email.blank?
  #     end
  #   end
  # end

end
