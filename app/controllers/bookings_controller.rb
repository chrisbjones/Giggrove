class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @gig = Gig.find(params[:gig_id])
    @booking = Booking.new
    @booking.gig = @gig
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.gig = Gig.find(params[:gig_id])
    @booking.requester = params[:requester]
    if @booking.save
      redirect_to root_path, notice: "Booking was successfully made"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @booking = Booking.find(params[:id])
    if params[:commit] == 'Accept'
      @booking.update(status: 'accepted')
      redirect_to dashboard_path, notice: 'Booking accpeted'
    elsif params[:commit] == 'Reject'
      @booking.update(status: 'rejected' )
      if @booking.gig.status == 'rejected'
        @booking.destroy
        redirect_to dashboard_path, notice: 'Booking rejected and deleted'
      else
        redirect_to dashboard_path, notice: 'Booking rejected'
      end
    end
  end

  def destroy
    @booking = Booking.find(params[:id])

    if @booking.destroy
      redirect_to dashboard_path, notice: "Booking has been cancelled"
    end
  end

  # def approve
  #   booking = Booking.find(params[:id])
  #   booking.update(status: 'approved')
  #   redirect_to dashboard_path
  # end

  def approve
    booking = Booking.find_by(id: params[:id])
    if booking
      booking.update(status: 'approved')
      redirect_to dashboard_path, notice: 'Booking approved'
    else
      # Handle the case where the booking is not found (e.g., redirect with an error message)
      redirect_to dashboard_path, alert: 'Booking not found'
    end
  end

  def decline
    booking = Booking.find(params[:id])
    booking.update(status: 'declined')
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :time, :user_id, :gig_id, :status, :requester)
  end
end
