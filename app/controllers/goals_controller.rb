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

  private

  def goal_params
    params.require(:goal).permit(:category, :category_type, :date, :note)
  end
end
