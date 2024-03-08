class DashboardsController < ApplicationController
  def show
    # @user = current_user
    # @gigs = @user.gigs
    # bookings = Booking.all
    # requests = bookings.reject { |booking| booking.requester == current_user.id }
    # @requests = requests.sort_by(&:created_at)

    # @user = current_user
    # @bookings = current_user.bookings
    # @requests = @bookings.reject { |booking| booking.requester == current_user.id }
    @user = current_user
    @requests = Booking.where(user_id: @user.id).upcoming
    @user_gigs = @user.gigs.includes(:bookings)
  end
end
