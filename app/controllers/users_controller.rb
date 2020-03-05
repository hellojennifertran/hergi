class UsersController < ApplicationController
  def dashboard
    @goals = Goal.where(user:current_user)

  end

  def profile
    @user = User.find(params[:id])
    @goals = Goal.where(user: @user)
  end

  def update
    @user = current_user
    @user.update(profile_params)
  end

  private

  def profile_params
    params.require(:user).permit(:description, :photo)
  end
end
