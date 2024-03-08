class GigsController < ApplicationController
  before_action :authenticate_user!

  def index
    @gigs = Gig.all
    @user = current_user
    @gig = @user.gigs
    @all_gigs = Gig.all
    if params[:query].present?
      @gigs = Gig.global_search(params[:query])
    else
      @gigs = Gig.all
    end
  end

  def show

    @gig = Gig.find(params[:id])
    @user = current_user

    @booking = Booking.new
    @booking.gig = @gig

    if @gig.geocoded?
      @marker = {
        lat: @gig.latitude,
        lng: @gig.longitude
      }
    end
  end

  def new
    @gig = Gig.new
    @user = current_user
  end

  def create
    @gig = Gig.new(gig_params)
    @gig.user_id = current_user.id

    if @gig.save
      redirect_to gig_path(@gig), notice: 'Gig was successfully created.'
    else
      render :new
    end
  end

  def approve
    @gig = Gig.find(params[:id])

  end

  private

  def gig_params
    params.require(:gig).permit(:name, :location, :category, :description, :photo)
  end
end
