class RoomsController < ApplicationController
  def index
    @rooms = RoomUser.where(user_id: current_user.id)
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

  private
  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
