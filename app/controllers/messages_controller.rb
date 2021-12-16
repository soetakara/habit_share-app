class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
    @habits = @room.habits
    @my_habits = Habit.where(user_id: current_user.id)
    @not_habits = not_set_habit
  end 
  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
    redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end
  private
  def message_params
    params.require(:message).permit(:comment).merge(user_id: current_user.id)
  end
  def not_set_habit
    if @room.user_ids.length > @habits.length
      habits = []
        @habits.each do |habit|
          habits << habit.user_id
        end
        not_habit = []
        @room.user_ids.each do |user|
           if habits.include?(user)
           elsif 
            not_habit << User.find(user)
           end
        end
        return(not_habit)
    end
  end
end