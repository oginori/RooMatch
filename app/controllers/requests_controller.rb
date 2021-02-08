class RequestsController < ApplicationController
  before_action :login_judgement
  before_action :set_request, only: [:edit, :update, :show, :destroy]

  def index
    @requests = Request.all
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
  end

  def show
  end

  private

  def request_params
    params.require(:request).permit(:room_size, :room_img, :room_img_cache, :budget, :deadline, :remarks )
  end

  def set_request
    @request = Request.find(params[:id])
  end
end