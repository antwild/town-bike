class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_bike, only: [:show, :edit, :update, :destroy]
  # there is no root for this Action??? we only have pages#home for the root
  def index
    @bikes = policy_scope(Bike).order(created_at: :desc)
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

  def show
    rating(@bike)
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

  def rating(param)
    reviews = param.reviews
    sum = 0
    reviews.each do |r|
      sum += r.stars
    end
    if reviews.count.positive?
      @raw_rating = sum.to_f / reviews.count
      @full_stars = @raw_rating.floor
      @half_stars = ((((@raw_rating * 2).round.to_f / 2) - @full_stars) * 2).to_i
      @emtpy_stars = 5 - @full_stars - @half_stars
      @rating = { full_stars: @full_stars, half_stars: @half_stars, empty_stars: @emtpy_stars }
    else
      @rating = { full_stars: 0, half_stars: 0, empty_stars: 0 }
    end
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
