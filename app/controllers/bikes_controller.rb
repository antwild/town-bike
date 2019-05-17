class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit, :update, :destroy]
  def index
    @bikes = Bike.all
  end

  def show
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.owner = current_user
    authorize @bike
    if @bike.save
      redirect_to @bike
    else
      format.html { render :new }
    end
  end

  def edit
  end

  def update
    if @bike.update(bike_params)
      redirect_to @bike
    else
      format.html { render :edit }
    end
  end

  def destroy
    @bike.destroy
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
    authorize @bike
  end

  def bike_params
    params.require(:bike).permit(:description, :make, :model, :color, :type, :frame_size, :foldable, :location)
  end
end
