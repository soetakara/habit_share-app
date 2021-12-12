class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room_id = params[:room_id]
    # @room = Room.find(params[:room_id])
    # @messages = @room.messages.includes(:user)
  end
  def create
    @message = Message.new(message_params)
    if @message.save
    redirect_to messages_path
    else
      render :index
    end
  end
  private
  def message_params
    params.require(:message).permit(:comment).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
