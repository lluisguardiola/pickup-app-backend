class Attendance < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :user, uniqueness: { scope: :event,
  message: "already signed up for this event." }
end
