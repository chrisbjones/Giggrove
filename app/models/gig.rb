class Gig < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :category, :location, :description, presence: true
end
