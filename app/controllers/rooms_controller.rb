class RoomsController < ApplicationController
  before_action :set_room, only: [:destroy]

  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.user_ids == [current_user.id]
      render :new
    elsif  @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @room.destroy
    redirect_to root_path
  end

  def habit_change
    @room = Room.find(params[:id])  
    @room_habits = RoomHabit.all
    @room_habits.each_with_index do |room_habit|
      if room_habit.room_id == @room.id && room_habit.habit_id == params[:habit_id].to_i
        @room_habit = RoomHabit.find(room_habit.id)
        @room_habit[:habit_id] = params[:select_habit_id]
        @room_habit.save
        redirect_to "/rooms/#{@room.id}/messages"
      end
    end
  end

  def habit_add
    @room = params[:id].to_i 
    @habit = params[:select_habit_id].to_i
    roomhabit_params = {}
    roomhabit_params[:room_id] = @room
    roomhabit_params[:habit_id] = @habit
    RoomHabit.create(roomhabit_params)
    redirect_to "/rooms/#{@room}/messages"
  end

  private
  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end

  def set_room
    @room = Room.find(params[:id])
  end

end

