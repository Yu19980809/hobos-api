class Api::V1::ComedianFollowingsController < Api::V1::BaseController
  def index
    @comedians = []
    comedian_followings = ComedianFollowing.where(user: @current_user)
    comedian_followings.each do |cf|
      @comedians.unshift(User.find(cf.comedian_id))
    end
  end

  def create
    comedian_following = ComedianFollowing.new(comedian_following_params)
    comedian_following.user = @current_user
    if comedian_following.save
      render json: { message: 'success' }
    else
      render json: comedian_following.errors, status: :unprocessable_entity
    end
  end

  def destroy
    comedian_following = ComedianFollowing.where(user: @current_user, comedian_id: params[:id]).first
    if comedian_following.destroy
      render json: { message: 'success' }
    else
      render json: comedian_following.errors, status: :unprocessable_entity
    end
  end

  private

  def comedian_following_params
    params.require(:comedian_following).permit(:comedian_id)
  end
end
