class Event < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5 }
  validates :date, presence: true
end
