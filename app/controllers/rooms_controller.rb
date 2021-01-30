class RoomsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @room = Room.create(room_params)
    @entry1 = RoomUser.create(:room_id => @room.id, :user_id => current_user.id)
    @entry2 = RoomUser.create(:room_id => @room.id, user_id: params[:user_id])
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    if RoomUser.where(:user_id => current_user.id, :room_id => @room.id).present?
      @messages = @room.chats
      @message = Chat.new
      @entries = @room.room_users
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def room_params
    params.require(:room).permit(:name)
  end
end
