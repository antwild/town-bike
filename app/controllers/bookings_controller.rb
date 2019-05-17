class BookingsController < ApplicationController
  before_action :set_bookings, only: [:show, :edit, :update, :destroy]
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = user
    authorize @booking
    if @booking.save
      redirect_to @booking
    else
      format.html { render :new }
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking
    else
      format.html { render :edit }
    end
  end

  def destroy
    @booking.destroy
  end

  private

  def set_bookings
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def bookig_params
    params.require(:booking).permit(:bike_id, :start_date, :end_date, :rider_id)
  end
end
