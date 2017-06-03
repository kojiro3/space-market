class Space < ApplicationRecord
  belongs_to :owner
  has_many :reservations

  validates :name, :purpose, :text, :postal_code, :prefecture, :city, :town, :tel, :access, :number, presence: true
  validates :name, length: { maximum: 50 }
  validates :body, length: { maximum: 64 }
  validates :text, length: { in: 10..800 }
  validates :postal_code, length: { is: 7 }, numericality: :only_integer
  validates :price, :number, numericality: true

  scope :party, -> { where(purpose: 'パーティー') }
  scope :meeting, -> { where(purpose: '会議') }
  scope :photo, -> { where(purpose: '写真撮影') }
  scope :location, -> { where(purpose: 'ロケ撮影') }
  scope :event, -> { where(purpose: 'イベント') }
  scope :stay, -> { where(purpose: '宿泊') }
  scope :other, -> { where(purpose: 'その他') }

  mount_uploader :image, ImageUploader
end
