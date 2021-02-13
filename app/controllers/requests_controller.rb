class RequestsController < ApplicationController
  before_action :login_required
  before_action :set_request, only: [:edit, :update, :show, :destroy]

  def index
    @requests = Request.all

    if resident_signed_in?
      @coordinators = Coordinator.all
    elsif coordinator_signed_in?
      @residents = Resident.all
    end
    
  end

  def new
    @request = Request.new
  end

  def create
    @request = current_resident.requests.build(request_params)

    if @request.save
      redirect_to request_path(@request.id), notice: 'request was successfully created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @request = Request.update
  end

  def show
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

  private

  def request_params
    params.require(:request).permit(:room_size, :room_img, :room_img_cache, :budget, :deadline, :remarks, :resident_id)
  end

  def set_request
    @request = Request.find(params[:id])
  end
end