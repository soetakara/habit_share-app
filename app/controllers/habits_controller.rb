class HabitsController < ApplicationController
  before_action :set_habit, only: [:edit, :update, :destroy]
  def new
    @habit = Habit.new
    # @room = Room.find(params[:room_id])
  end
  def create
    @habit = Habit.new(habit_params)
    if @habit.save
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @habit.update(habit_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @habit.destroy
    redirect_to users_path
  end
  private
  def habit_params
    params.require(:habit).permit(:title, :item1, :item2, :item3, :item4, :item5).merge(user_id: current_user.id)
  end

  def set_habit
    @habit = Habit.find(params[:id])
  end
end
