class MessagesController < ApplicationController
  before_action :login_required
  
  def create
    @room = Room.find(params[:room_id])
    @message = Message.new(message_params)
    if resident_signed_in?
      @message.is_resident = true
      @message.sender_id = current_resident.id
    elsif coordinator_signed_in?
      @message.is_resident = false
      @message.sender_id = current_coordinator.id
    end
    @message.room_id = @room.id
    if @message.save
      redirect_to room_url(@room)
    else
      redirect_to room_url(@room), notice: 'メッセージを入力してください。'
    end
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end

end
