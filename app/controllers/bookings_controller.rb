class BookingsController < ApplicationController
  before_action :set_bookings, only: [:edit, :destroy, :update]
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  private

  def set_bookings
    @booking = Booking.find(params[:id])
  end

  def bookig_params
    params.require(:booking).permit(:bike_id, :start_date, :end_date, :rider_id)
  end
end
