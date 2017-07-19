class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    unsubscribed
    stream_from "messages_#{params[:chat_room_id]}"
    @chat_room = ChatRoom.find_by(id: params[:chat_room_id])
    @chat_room.subscriptions.create(user_id: current_user.id)
  end

  def unsubscribed
    @subscription = Subscription.find_by(user_id: current_user.id)
    if @subscription
      @subscription.destroy
    end
  end
end
