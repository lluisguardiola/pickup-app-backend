class Event < ApplicationRecord
  belongs_to :host, class_name: :User, foreign_key: "user_id"
  belongs_to :game
  has_many :attendances, dependent: :delete_all
  has_many :attendees, through: :attendances, source: :user

end
