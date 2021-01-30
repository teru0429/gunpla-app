class ChatsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    if RoomUser.where(:user_id => current_user.id, :room_id => params[:chat][:room_id]).present?
      @message = Chat.create(chat_params)
      redirect_to "/rooms/#{@message.room_id}"
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:user_id, :message, :room_id).merge(:user_id => current_user.id)
  end
end
