class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { minimum: 3 }

  has_many :events, foreign_key: "creator_id", class_name: "Event"
  has_many :sign_ups, foreign_key: :attendee_id
  has_many :event_attendeds, through: :sign_ups
end
