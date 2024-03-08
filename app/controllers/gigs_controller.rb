class GigsController < ApplicationController
  before_action :authenticate_user!

  def index
    @gigs = Gig.all
    @user = current_user
    @gig = @user.gigs
  end

  def show
    @gig = Gig.find(params[:id])
    @user = current_user
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

  def destroy
    gig.destroy
    redirect_to dashboard_path, notice: "Gig was successfully deleted"

  end

  private

  def gig_params
    params.require(:gig).permit(:name, :category, :description, :photo)
  end

  def set_gig
    @gig = Gig.find(params[:id])
  end
end
