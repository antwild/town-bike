class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :create, :update]
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
    @bike.save
  end

  def edit
    @bike = Bike.find(params[:id])
  end

  def update
    @bike = Bike.find(params[:id])
    @bike.update(bike_params)
  end

  def destroy
    @bike = Bike.find(params[:id])
    @bike.destroy
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
  end

  def bike_params
    params.require(:bike).permit(:description, :make, :model, :color, :type, :frame_size, :foldable, :location)
  end
end
