class HabitsController < ApplicationController
  def index
  end
  def new
    @habit = Habit.new
  end
  def create
    @habit = Habit.new(habit_params)
    if @habit.save
      redirect_to users_path
    else
      render :new
    end
  end
  private
  def habit_params
    params.require(:habit).permit(:title, :item1, :item2, :item3, :item4, :item5).merge(user_id: current_user.id)
  end
end
