class BookingsController < ApplicationController
before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def new
    @property = Property.find(params[:property_id])
    @booking = Booking.new
  end

  def show
    @booking_marker = @booking.property.geocode
    @markers = [{
        lat: @booking_marker.first,
        lng: @booking_marker.last,
        info_window: render_to_string(partial: "info_window", locals: { property: @booking.property })
      }]
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.property = Property.find(params[:property_id])
    if @booking.save
      redirect_to booking_list_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to booking_list_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :property_id)
  end
end
