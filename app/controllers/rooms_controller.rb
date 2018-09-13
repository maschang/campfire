class RoomsController < ApplicationController

  def index
    @users = User.all
    @rooms = current_user.rooms
  end

  def show
    @room = Room.find_by(room_number: params[:id])
    @messages = Message.where(room: @room)

    #TODO current_userがroomに入室できるかチェック
  end
end
