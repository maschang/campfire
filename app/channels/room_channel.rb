class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    user = current_user
    room = Room.find_by(room_number: data['room'])

    Message.create! content: data['message'], user: user, room: room
  end
end
