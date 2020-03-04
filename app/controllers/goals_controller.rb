class GoalsController < ApplicationController
  def index
    @goals = Goal.all
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to goal_path(@goal.id)
    else
      render :new
    end
  end

  def new
    @goal = Goal.new
  end

  def update
    @goal.update(goal_params)
  end

  def privatize_all
    private_goals = params[:privatize_goals][:goal_ids].map{ |id| Goal.find(id) }
    private_goals.each { |goal| goal.update(private: true) }
    public_goals = current_user.goals - private_goals
    public_goals.each { |goal| goal.update(private: false) }
    redirect_to profile_path(current_user)
  end

  private

  def goal_params
    params.require(:goal).permit(:category, :category_type, :date, :note, :private)
  end
end
