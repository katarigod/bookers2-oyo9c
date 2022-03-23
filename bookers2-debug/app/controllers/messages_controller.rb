class MessagesController < ApplicationController

  def show
    @user = User.find(params[:id])
    rooms = current_user.entries.pluck(:room_id)
    entry = Entry.find_by(user_id: @user.id, room_id: rooms)

    room = nil
    if entry.nil?
      room = Room.new
      room.save
      Entry.create(user_id: @user.id, room_id: room.id)
      Entry.create(user_id: current_user.id, room_id: room.id)
    else
      roomed = entry.room_id
      room = Room.find(roomed)
    end

    @messages = room.messages
    @message = Message.new(room_id: room.id)
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      rooms = Room.find(params[:message][:room_id])
      @messages = rooms.messages
    else
      redirect_to post_path(:room_id)
    end
  end

  private

  def message_params
    params.require(:message).permit(:message, :room_id)
  end

end
