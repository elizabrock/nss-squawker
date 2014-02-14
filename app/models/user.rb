class User < ActiveRecord::Base
  include Gravtastic
  has_gravatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :squeeks
  has_many :relationships, foreign_key: "consumer_id"
  has_many :reverse_relationships, foreign_key: "broadcaster_id", class_name: "Relationship"
  has_many :consumers, through: :relationships, source: :consumer
  has_many :broadcasters, through :reverse_relationships, source: :broadcaster

  def self.find_for_database_authentication(conditions)
    self.where(:username => conditions[:email]).first || self.where(:email => conditions[:email]).first
  end

  def consuming?(broadcaster)
    relationships.find_by(broadcaster_id: broadcaster.id)
  end

  def consume!(broadcaster)
    relationships.create!(broadcaster_id: broadcaster.id)
  end

  def unconsume(broadcaster)
    relationships.find_by(broadcaster_id: broadcaster.id).destroy
  end
end
