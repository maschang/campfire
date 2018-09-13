class RoomsController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @messages = Message.all
  end
end
