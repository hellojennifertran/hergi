class UsersController < ApplicationController
  def dashboard
    @goals = Goal.where(user:current_user)
  end
end
