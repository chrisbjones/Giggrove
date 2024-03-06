class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @gig = Gig.find(params[:gig_id])
    @booking = Booking.new
    # @user = current_user
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user
    if @booking.save
      redirect_to @booking, notice: "Booking was successfullty made"
    else
      render :new
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:date, :time, :user_id)
  end
end

