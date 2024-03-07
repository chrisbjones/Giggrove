class Gig < ApplicationRecord
  belongs_to :user
  has_many :bookings
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  validates :name, :category, :description, presence: true
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [:category],
  using: {
    tsearch: { prefix: true }
  }

end
