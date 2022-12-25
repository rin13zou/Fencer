class TrainingSpotController < ApplicationController

  def new
    @training_spot = TrainingSpot.new
  end

  def create
    @training_spot = TrainingSpot.new(training_spot_params)
    if @training_spot.save
      redirect_to  training_spot_index_path
    else

    end
  end

  def index
    @training_spots = TrainingSpot.all
  end

  def show
    @training_spot = TrainingSpot.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def training_spot_params
    params.require(:training_spot).permit(:address, :prefectures, :latitude, :longitude)
  end

end
