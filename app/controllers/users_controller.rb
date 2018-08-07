class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def index
    @users = User.all
  end

  def show
    @user = User.includes(slides: :user).find(params[:id])
  end

  private
  def set_user
    @user = User.find(params[:id])
    # authorize @user
  end

  def set_params
    params.require(:user).permit(:id, :email)
  end
end
