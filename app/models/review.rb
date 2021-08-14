class Review < ApplicationRecord
  belongs_to :property
  validates :rating, :inclusion => { :in => 1..5 }, :presence => { :message => " must be within 1-5" }
end
