class UsersController < ApplicationController
  def dashboard
    @goals = Goal.where(user:current_user)

  end

  def profile
    if (user.id == current_user)
      # display current user details
      @goals = Goals.where(user: current_user)
    else
      @goals = Goals.where(user: params[:id])
    end
  end
end
