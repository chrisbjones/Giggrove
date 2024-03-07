class GigsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @all_gigs = Gig.all
    if params[:query].present?
      @gigs = Gig.global_search(params[:query])
    else
      @gigs = Gig.all
    end
    @markers = @all_gigs.geocoded.map do |gig|
      {
        lat: gig.latitude,
        lng: gig.longitude
      }
    end
  end


  def show
    @gig = Gig.find(params[:id])
  end

  def new
    @gig = Gig.new
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

  private

  def gig_params
    params.require(:gig).permit(:name, :category, :description, :photo)
  end
end
