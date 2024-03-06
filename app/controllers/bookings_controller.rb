class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @gig = Gig.find(params[:gig_id])
    @booking.gig = @gig
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.gig = Gig.find(params[:gig_id])
    if @booking.save
      redirect_to root_path, notice: "Booking was successfully made"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :time, :user_id, :gig_id)
  end
end
