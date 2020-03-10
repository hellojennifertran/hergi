class GoalsController < ApplicationController
  def index
    # @goals = Goal.all.includes(:users)
  end

  def create
    @goal = Goal.new(goal_params)
    @user = current_user
    @goal.user = @user
    if @goal.save
      redirect_to root_path
    else
      render :new, locals: { category: params[:goal][:category]}
    end
  end

  def new
    @goal = Goal.new
    @category_type = Goal::CATEGORIES
    @my_title = build_title
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.update(goal_params)
    redirect_to dashboard_path
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to dashboard_path
  end

  def privatize_all
    private_goals = params[:privatize_goals][:goal_ids].map{ |id| Goal.find(id) }
    private_goals.each { |goal| goal.update(private: true) }
    public_goals = current_user.goals - private_goals
    public_goals.each { |goal| goal.update(private: false) }
    redirect_to profile_path(current_user)
  end

  private

  def build_title
    Goal::CATEGORIES.map do |h|
      if params[:category] == h[:category]
        "#{h[:icon]} #{h[:category]}"
      elsif params[:goal] && params[:goal][:category] == h[:category]
        "#{h[:icon]} #{h[:category]}"
      end
    end.compact.first
  end

  def goal_params
    params.require(:goal).permit(:category, :category_type, :date, :note, :private, :photo)
  end
end
