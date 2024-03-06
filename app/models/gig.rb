class Gig < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, :category, :description, presence: true
  has_one_attached :photo
end
