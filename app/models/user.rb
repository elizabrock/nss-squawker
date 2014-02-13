class User < ActiveRecord::Base
  include Gravtastic
  has_gravatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :squeeks

  after_validation :normalize_username, on: :create

  def self.find_for_database_authentication(conditions)
    self.where(:username => conditions[:email]).first || self.where(:email => conditions[:email]).first
  end

  protected
    def normalize_username
      self.username = self.username.downcase if self.username
    end
end
