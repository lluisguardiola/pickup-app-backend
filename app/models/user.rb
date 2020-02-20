class User < ApplicationRecord
    has_many :events
    has_many :user_games
    has_many :games, through: :user_games
    has_many :attendances
    has_many :attended_events, through: :attendances, source: :event

    has_secure_password
end
