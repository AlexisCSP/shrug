class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

  def create
    @chat_room = ChatRoom.new(chat_room_params)
    if @chat_room.save
      flash[:success] = 'Chat room added!'
      redirect_to homepostlogin_path
    else
      render 'new'
    end
  end

  def destroy
    ChatRoom.find(params[:id]).destroy
    flash[:success] = "Chat room deleted"
    redirect_to homepostlogin_url
  end

  def title
    return :title
  end

  private

    def chat_room_params
      params.require(:chat_room).permit(:title, :description, :user_id, :latitude, :longitude)
    end


end
