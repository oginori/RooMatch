class RequestsController < ApplicationController
  before_action :login_required
  before_action :set_request, only: [:edit, :update, :show, :destroy]

  def new
    @request = Request.new
  end

  def create
    if current_resident.requests.where(status: false).present?
      
      Request.where(resident_id: current_resident.id, status: false).present?
      flash[:alert] = '未完了のリクエストがあるため新規リクエストを作成できません'
      redirect_to new_request_path
    else
      @request = current_resident.requests.build(request_params)

      if @request.save
        redirect_to request_path(@request.id), notice: 'request was successfully created'
      else
        render :new
      end
    end
  end

  def edit; end

  def update
    @request.update(request_params)
  end

  def show; end

  private

  def request_params
    params.require(:request).permit(:room_size, :room_img, :room_img_cache, :budget, :deadline, :remarks, :resident_id, :status)
  end

  def set_request
    @request = Request.find(params[:id])
  end
end