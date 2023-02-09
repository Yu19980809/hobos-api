class Api::V1::ClubsController < Api::V1::BaseController
  def create
    club = Club.create(club_params)
    if club.save
      render json: { message: 'success' }
    else
      render json: club.errors, status: :unprocessable_entity
    end
  end

  private

  def club_params
    params.require(:club).permit(:name, :address, :description, :user_id)
  end
end
