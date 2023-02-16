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

  def comedian
    @comedian = User.find(params[:id])
    @shows = []
    ShowComedian.where(user: @comedian).each do |sc|
      @shows.unshift(sc.show)
    end
  end

  def club_followers
    club_followers = ClubFollowing.where(club: @current_user.clubs.first)
    render json: { club_followers: }
  end

  def comedian_followers
    comedian_followers = ComedianFollowing.where(comedian: @current_user)
    render json: { comedian_followers: }
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :role, :slogan, :experience, :avatar)
  end
end
