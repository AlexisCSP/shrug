class AddLatlngToChatRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :chat_rooms, :latitude, :decimal, { precision: 10, scale: 6 }
    add_column :chat_rooms, :longitude, :decimal, { precision: 10, scale: 6 }
  end
end
