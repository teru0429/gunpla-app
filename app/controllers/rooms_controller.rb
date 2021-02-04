class RoomsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @room = Room.create
    # binding.pry
    @entry1 = RoomUser.create(:room_id => @room.id, :user_id => current_user.id, name: room_users_params[:name])
    @entry2 = RoomUser.create(room_users_params)
    redirect_to room_path(@room)
  end

  def show
    @room = Room.find(params[:id])
    @room_users = RoomUser.find_by(room_id: @room.id, user_id: current_user.id)
    if RoomUser.where(:user_id => current_user.id, :room_id => @room.id).present?
      @messages = @room.chats
      @message = Chat.new
      @entries = @room.room_users
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def room_users_params
    params.require(:room_user).permit(:user_id, :room_id, :name).merge(room_id: @room.id)
    
  end
end
