class InteriorsController < ApplicationController
  before_action :login_required
  before_action :set_interior, only: [:edit, :update, :show, :destroy]

  def index
    @interiors = Interior.page(params[:page]).per(3)
    @favorites = current_resident.favorites if current_resident.present?
  end

  def new
    @interior = Interior.new
  end
  
  def create
    @interior = current_coordinator.interiors.build(interior_params)
    if params[:back]
      render :new
    else
      if @interior.save
        redirect_to coordinator_path(@interior.coordinator_id), notice: '新しいインテリア作品を登録しました'
      else
        render :new
      end
    end
  end

  def edit; end

  def update
    if @interior.update(interior_params)
      redirect_to interior_path(@interior.id), notice: "インテリア作品を更新しました"
    else
      render :edit
    end
  end

  def show
    if resident_signed_in?
      @favorite = current_resident.favorites.find_by(interior_id: @interior.id)
    end
  end

  def destroy
    @interior.destroy
    redirect_to coordinator_path(@interior.coordinator.id)
    flash[:notice] = "インテリア作品を削除しました"
  end

  private

  def interior_params
    params.require(:interior).permit(:design_img, :design_image_cache, :date_of_creation, :budget, :description, :coordinator_id)
  end

  def set_interior
    @interior = Interior.find(params[:id])
  end
end
