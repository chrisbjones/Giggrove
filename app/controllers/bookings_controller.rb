class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to new_gig_booking(@gig)
  end
end

  private
  def booking_params
    params.require(:booking).permit(:date, :time, :user_id)
  end
end
