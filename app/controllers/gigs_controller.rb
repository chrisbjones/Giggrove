class GigsController < ApplicationController
  before_action :authenticate_user!

  def index
    @gigs = Gig.all
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
