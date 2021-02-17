class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id]) #ルーム情報の取得
    @message = Message.new #新規メッセージ投稿
    @messages = @room.messages #このルームのメッセージを全て取得
    if resident_signed_in?
      if @room.resident.id == current_resident.id
        @coordinator = @room.coordinator
      else
        redirect_to "/"
      end
    elsif coordinator_signed_in?
      if @room.coordinator.id == current_coordinator.id
        @resident = @room.resident
      else
        redirect_to "/"
      end

    else
      redirect_to "/"
    end
  end

  def create
    if resident_signed_in?
      #userがログインしてたらuser_idを, shopがログインしてたらshop_idを@roomにいれる
      @room = Room.new(room_coordinator_params)
      @room.resident_id = current_resident.id
    elsif coordinator_signed_in?
      @room = Room.new(room_resident_params)
      @room.coordinator_id = current_coordinator.id
    else
      if resident_signed_in?
        redirect_to resident_path(current_resident.id)
      else
        redirect_to coordinator_path(current_coordinator.id)
      end
    end


    if @room.save!
      redirect_to room_path(@room.id)
    else
      redirect_to "/"
    end
  end

  private
  def room_coordinator_params
    params.require(:room).permit(:coordinator_id, :contract_id)
  end

  def room_resident_params
    params.require(:room).permit(:resident_id, :contract_id)
  end
end
