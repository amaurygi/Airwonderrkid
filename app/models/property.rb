class Property < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, dependent: :destroy
  has_many_attached :photos

  validates :name, :address, :price, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
