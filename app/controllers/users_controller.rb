class UsersController < ApplicationController
  def dashboard
    @goals = Goal.where(user:current_user)
    @health = @goals.where(category: "Health").count
    @exploration = @goals.where(category: "Exploration").count
    @relationship = @goals.where(category: "Relationship").count
  end

  def profile
    @user = User.find(params[:id])
    @goals = Goal.where(user: @user).reverse
  end

  def update
    @user = current_user
    if (params.dig(:privatize_goals, :goal_ids))
      private_goals = params[:privatize_goals][:goal_ids].map{ |id| Goal.find(id) }
      private_goals.each { |goal| goal.update(private: true) }
      public_goals = current_user.goals - private_goals
      public_goals.each { |goal| goal.update(private: false) }
    end
    if @user.update(profile_params)
      flash[:notice] = "Profile successfully updated"
      redirect_to profile_path(current_user)
    else
      render :profile
    end
  end

  private

  def profile_params
    params.require(:user).permit(:note, :photo)
  end
end
