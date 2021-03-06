class UsersController < ApplicationController
  def dashboard
    @goals = Goal.all
    @health = current_user.goals.where(category: "Health").count
    @exploration = current_user.goals.where(category: "Exploration").count
    @relationship = current_user.goals.where(category: "Relationship").count
    redirect_to update_goals_path if current_user.health_goal.nil? && current_user.exploration_goal.nil? && current_user.relationships_goal.nil?
    @user = current_user
  end

  def profile
    @user = User.find(params[:id])
    @goals = Goal.where(user: @user).reverse
    @posts = Post.where(user: @user).reverse
    # @events = current_user.events.group(:date)
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

  def save_event
    current_user.events << params[:event_id]
    current_user.save
    redirect_to discovers_path
  end

  def delete_event
    current_user.events.delete(params[:event_id])
    current_user.save
    if params[:page] == 'saved'
      redirect_to saved_events_path
    else
      redirect_to discovers_path
    end
  end

  def update_goals_number
    @user = current_user
    @health_goal = @user.health_goal
    @exploration_goal = @user.exploration_goal
    @relationships_goal = @user.relationships_goal

  end

  def set_goals
    current_user.update(health_goal: params[:goals][:health], exploration_goal: params[:goals][:explore], relationships_goal: params[:goals][:relationship])
    redirect_to dashboard_path
  end

   private

  def profile_params
    params.require(:user).permit(:note, :photo)
  end
end
