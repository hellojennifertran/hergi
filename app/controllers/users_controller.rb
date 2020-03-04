class UsersController < ApplicationController
  def dashboard
    @goals = Goal.where(user:current_user)

  end

  def profile
    @user = User.find(params[:id])
    @goals = Goal.where(user: @user)
  end
end
