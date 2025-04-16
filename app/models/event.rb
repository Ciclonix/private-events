class Event < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5 }
  validates :date, presence: true
  validates :location, presence: true

  belongs_to :creator, class_name: "User"
end
