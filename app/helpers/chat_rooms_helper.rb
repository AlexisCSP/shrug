module ChatRoomsHelper
  require 'geocoder'

  def is_chat_room_in_radius?(chat_room)
    Geocoder::Calculations.distance_between([chat_room.latitude, chat_room.longitude], [current_user.latitude, current_user.longitude]) < 1000
  end
end
