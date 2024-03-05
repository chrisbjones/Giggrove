class GigsController < ApplicationController
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
    if @gig.save!
      redirect_to root_path, notice: 'Gig was successfully created.'
    else
      render :new
    end
  end

  private

    def gig_params
      params.require(:gig).permit(:name, :category, :description)
    end

end
