class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_bike, only: %i[show edit update destroy]
  # there is no root for this Action??? we only have pages#home for the root
  def index
    if params[:s].blank?
      @bikes = policy_scope(Bike).order(created_at: :desc)
      @bike_locs = @bikes.where.not(latitude: nil, longitude: nil)
      @markers = @bike_locs.map do |bike|
        {
          lat: bike.latitude,
          lng: bike.longitude,
          infoWindow: render_to_string(partial: "infowindow", locals: { bike: bike })
        }
      end
      @bikes.each { |bike| rating(bike) }
    else
      @bikes = policy_scope(Bike).search_by_make_and_model(params[:s])
      @bike_locs = Bike.where.not(latitude: nil, longitude: nil)
      @markers = @bike_locs.map do |bike|
        {
          lat: bike.latitude,
          lng: bike.longitude,
          infoWindow: render_to_string(partial: "infowindow", locals: { bike: bike })
        }
      end
      @bikes.each { |bike| rating(bike) }
    end
  end

  def show
    rating(@bike)
    @booking = Booking.where(bike: @bike, rider: current_user).first
    @review = Review.new
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
    params.require(:bike).permit(:description, :make, :model, :color, :bike_type, :frame_size, :foldable, :location, :price, :photo)
  end
end
