class Event < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :attendees
end
