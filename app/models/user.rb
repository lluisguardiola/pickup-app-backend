class User < ApplicationRecord
    has_many :events
    has_many :user_games
    has_many :games, through: :user_games
    has_many :attendees

    has_secure_password
end
