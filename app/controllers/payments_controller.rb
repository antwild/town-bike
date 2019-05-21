class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
    @booking = Booking.find(params[:booking_id])
    authorize @booking
  end

  def create
    @payment = Payment.new
    @booking = Booking.find(params[:booking_id])
    @payment.booking = @booking
    authorize @booking
    if @payment.save
      redirect_to root_path
    else
      render :new
    end
  end
end
