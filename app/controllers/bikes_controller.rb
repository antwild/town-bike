class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_bike, only: [:show, :edit, :update, :destroy]
  # there is no root for this Action??? we only have pages#home for the root
  def index
    @bikes = policy_scope(Bike).order(created_at: :desc)
  end
  def show
  end

  def new
    @bike = Bike.new
    authorize @bike
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.owner = current_user
    authorize @bike
    if @bike.save
      redirect_to @bike
    else
      render :new
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
    # other params to consider are -
    params.require(:bike).permit(:description, :make, :model, :color, :bike_type, :frame_size, :foldable, :location, :price)
  end
end
