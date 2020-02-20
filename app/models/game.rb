class Game < ApplicationRecord
    has_many :events
    has_many :attendees, through: :events
    has_many :user_games
end
