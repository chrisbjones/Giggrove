class DashboardsController < ApplicationController
  def show
    @user = current_user
# to implement this you need to save two user ids on the booking you need requester_id and you already have booking.user
    @requests = @user.bookings.reject { |booking| requester_id == current_user.id }
  end
end
