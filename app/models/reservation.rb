class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :space
  has_one :event

  validates :year, :month, :day, presence: true
end
