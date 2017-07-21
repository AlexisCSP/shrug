class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_from "messages_#{params[:chat_room_id]}"
    @chat_room = ChatRoom.find_by(id: params[:chat_room_id])
    @chat_room.subscriptions.create(user_id: current_user.id)
    ActionCable.server.broadcast("messages_#{params[:chat_room_id]}",
      message: "<b>" + current_user.name + "</b> joined the chatroom",
      user: ""
    )
  end

  def unsubscribed
    @subscriptions = Subscription.where(user_id: current_user.id)
    if @subscriptions
      @subscriptions.each do |sub|
        sub.destroy
      end
    end
    ActionCable.server.broadcast("messages_#{params[:chat_room_id]}",
      message: "<b>" + current_user.name + "</b> left the chatroom",
      user: ""
    )
  end
end
