class Event < ApplicationRecord
  belongs_to :space
  belongs_to :reservation
  has_many :event_users
  has_many :users, through: :event_users
end
