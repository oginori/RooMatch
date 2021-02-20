class RoomsController < ApplicationController
  before_action :login_required
  
  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages
    if resident_signed_in?
      if @room.resident.id == current_resident.id
        @coordinator = @room.coordinator
      else
        redirect_to resident_path(current_resident.id)
      end
    elsif coordinator_signed_in?
      if @room.coordinator.id == current_coordinator.id
        @resident = @room.resident
      else
        redirect_to coordinator_path(current_coordinator.id)
      end

    else
      redirect_to interiors_path, notice: 'Chatting Roomに飛べませんでした'
    end
  end

  def create
    if resident_signed_in?
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
