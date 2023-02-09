class Api::V1::BookingsController < Api::V1::BaseController
  def index
    @shows = []
    bookings = Booking.where(user: @current_user)
    bookings.each do |b|
      @shows.unshift(b.show)
    end
  end

  def create
    booking = Booking.new(booking_params)
    booking.user = @current_user
    if booking.save
      render json: { message: 'success' }
    else
      render json: booking.errors, status: :unprocessable_entity
    end
  end

  def destroy
    booking = Booking.find(params[:id])
    if booking.destroy
      render json: { message: 'success' }
    else
      render json: booking.errors, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:show_id)
  end
end
