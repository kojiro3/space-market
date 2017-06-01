class Space < ApplicationRecord
  belongs_to :owner
  has_many :reservations

  validates :name, :purpose, :text, :postal_code, :prefecture, :city, :town, :tel, :access, presence: true
  validates :name, length: { maximum: 50 }
  validates :text, length: { in: 10..800 }
  validates :postal_code, length: { is: 7 }, numericality: :only_integer
  validates :price, numericality: true
end
