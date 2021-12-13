class HabitsController < ApplicationController
  def new
    @habit = Habit.new
    @room = Room.find(params[:room_id])
  end
  def create
    @room = Room.find(params[:room_id])
    @habit = @room.habits.new(habit_params)
    if @habit.save
      redirect_to room_messages_path(@room)
    else
      render :new
    end
  end
  private
  def habit_params
    params.require(:habit).permit(:title, :item1, :item2, :item3, :item4, :item5).merge(user_id: current_user.id)
  end
end
