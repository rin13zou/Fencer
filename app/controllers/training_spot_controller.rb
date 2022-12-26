class TrainingSpotController < ApplicationController

  def new
    @training_spot = TrainingSpot.new
  end

  def create
    @training_spot = TrainingSpot.new(training_spot_params)
    if @training_spot.save
      redirect_to  training_spot_index_path, notice: "登録完了しました"
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
    @training_spot = TrainingSpot.find(params[:id])
  end

  def update
    training_spot = TrainingSpot.find(params[:id])
    training_spot.update(training_spot_params)
    redirect_to training_spot_index_path, notice: "変更完了しました"
  end

  def destroy
    training_spot = TrainingSpot.find(params[:id])
    training_spot.destroy
    redirect_to training_spot_index_path, alert: "登録削除しました"
  end

  private

  def training_spot_params
    params.require(:training_spot).permit(:address, :prefectures, :latitude, :longitude, :club_name)
  end

end
