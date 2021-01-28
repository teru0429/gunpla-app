class ChatsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    if RoomUser.where(:user_id => current_user.id, :room_id => params[:chat][:room_id]).present?
      @message = Chat.create(params.require(:chat).permit(:user_id, :content, :room_id).merge(:user_id => current_user.id))
      redirect_to "/rooms/#{@message.room_id}"
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
