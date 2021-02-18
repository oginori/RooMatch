class MsgTopsController < ApplicationController
  before_action :login_required
  
  def index
    if resident_signed_in?
      @coordinators = Coordinator.all
      rooms = current_resident.rooms
      #自分が入ってるroomの相手のidを格納する
      @coordinator_ids = []
      rooms.each do |r|
        @coordinator_ids << r.coordinator_id
      end

    elsif coordinator_signed_in?
      @residents = Resident.all
      rooms = current_coordinator.rooms
      #自分が入ってるroomの相手のidを格納する
      @resident_ids = []
      rooms.each do |r|
        @resident_ids << r.resident_id
      end
    end
  end
end
