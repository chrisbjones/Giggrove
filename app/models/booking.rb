class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :gig
  enum :status, { pending: 0, approved: 1, declined: 2 }

  scope :upcoming, -> { where('start_time > ?', Time.zone.now)}

  def self.upcoming_for_user(user)
    upcoming.where(user:)
  end
end
