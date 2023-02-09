class Api::V1::ClubFollowingsController < Api::V1::BaseController
  def index
    @clubs = []
    club_followings = ClubFollowing.where(user: @current_user)
    club_followings.each do |cf|
      @clubs.unshift(cf.club)
    end
  end

  def create
    club_following = ClubFollowing.new(club_following_params)
    club_following.user = @current_user
    if club_following.save
      render json: { message: 'success' }
    else
      render json: club_following.errors, status: :unprocessable_entity
    end
  end

  def destroy
    club_following = ClubFollowing.find(params[:id])
    if club_following.destroy
      render json: { message: 'success' }
    else
      render json: club_following.errors, status: :unprocessable_entity
    end
  end

  private

  def club_following_params
    params.require(:club_following).permit(:club_id)
  end
end
