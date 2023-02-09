class Api::V1::UsersController < Api::V1::BaseController
  def show
    @user = User.find(params[:id])
  end

  def update

  end

  private

  def user_params
    params.require(:user).permit(:nickname, :role, :slogan, :experience)
  end
end
