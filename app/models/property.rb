class Property < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :address, :price, presence: true
end
