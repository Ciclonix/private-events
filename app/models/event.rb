class Event < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5 }
  validates :date, presence: true
  validates :location, presence: true

  belongs_to :creator, class_name: "User"
  has_many :sign_ups, foreign_key: :event_attended_id
  has_many :attendees, through: :sign_ups

  scope :past, -> { where("date < ?", DateTime.now) }
  scope :future, -> { where("date > ?", DateTime.now) }
end
