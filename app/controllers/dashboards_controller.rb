class DashboardsController < ApplicationController
  def show
    # @user = current_user
    # @gigs = @user.gigs
    # bookings = Booking.all
    # requests = bookings.reject { |booking| booking.requester == current_user.id }
    # @requests = requests.sort_by(&:created_at)

    @user = current_user
    # @bookings = current_user.bookings
    @bookings = Booking.upcoming-upcoming_for_user(@user)
    @requests = @bookings.reject { |booking| booking.requester == current_user.id }
  rescue Act
  end
end

