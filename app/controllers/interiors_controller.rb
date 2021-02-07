class InteriorsController < ApplicationController
  before_action :set_interior, only: [:edit, :update, :show, :destroy]

  def index
    @interiors = Interior.all
    @favorites = current_resident.favorites
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
        redirect_to interiors_path, notice: 'post was successfully created'
      else
        render :new
      end
    end
  end

  def edit
    if current_resident.id != @interior.resident.id
      redirect_to interiors_path
    end
  end

  def update
    if @interior.update(interior_params)
      redirect_to interiors_path, notice: "Successfully edited your post!"
    else
      render :edit
    end
  end

  def show
    @favorite = current_resident.favorites.find_by(interior_id: @interior.id)
  end

  def destroy
    @interior.destroy
    redirect_to interiors_path, notice: "Successfully deleted!"
  end

  private

  def interior_params
    params.require(:interior).permit(:design_img, :design_image_cache, :date_of_creation, :budget, :description, :coordinator_id, )
  end

  def set_interior
    @interior = Interior.find(params[:id])
  end
end
