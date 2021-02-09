class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages
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
      @room = Room.new(room_coordinator_params)
      @room.resident_id = current_resident.id
    elsif coordinator_signed_in?
      @room = Room.new(room_resident_params)
      @room.coordinator_id = current_coordinator.id
    else
      redirect_to "/"
    end

    if @room.save
      redirect_to :action => "show", :id => @room.id
    else
      redirect_to "/"
    end
  end

  private
  def room_coordinator_params
    params.require(:room).permit(:coordinator_id)
  end

  def room_resident_params
    params.require(:room).permit(:resident_id)
  end
end
