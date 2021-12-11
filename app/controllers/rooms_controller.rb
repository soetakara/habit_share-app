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

  private
  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end

  def set_room
    @room = Room.find(params[:id])
  end
end
