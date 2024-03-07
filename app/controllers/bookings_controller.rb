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

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to dashboard
    else
      :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.delete
    redirect_to root_path, notice: "Booking has been cancelled"
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :time, :user_id, :gig_id, :status)
  end
end
