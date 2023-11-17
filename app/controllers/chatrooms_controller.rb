class ChatroomsController < ApplicationController

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @animal = @chatroom.adoption.animal
    @user = @animal.user
    @message = Message.new
  end
end
