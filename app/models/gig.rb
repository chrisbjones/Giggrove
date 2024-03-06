class Gig < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :category, :description, presence: true
end
