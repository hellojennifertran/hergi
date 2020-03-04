class GoalsController < ApplicationController
  def index
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    if @goal.save
      ""
    else
      render :new
    end
  end

  def new
    @goal = Goal.new
    @category_type = Goal::CATEGORIES
  end

  private

  def goal_params
    params.require(:goal).permit(:category, :category_type, :date, :note, :photo)
  end
end
