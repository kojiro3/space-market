class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :space

  validates :year, :month, :day, :start, :finish, presence: true
end
