class Api::V1::UsersController < Api::V1::BaseController
  def show
  end

  def update
    if @current_user.update(user_params)
      render json: { message: 'success' }
    else
      render json: @current_user.errors, status: :unprocessable_entity
    end
  end

  def fetch_bookings
    @bookings = Bookings.find_by(user: @current_user)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :role, :slogan, :experience)
  end
end
