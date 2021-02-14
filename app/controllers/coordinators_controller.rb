class CoordinatorsController < ApplicationController
  before_action :login_required
  
  def show
    @coordinator = Coordinator.find(params[:id])

    @request = Request.where(status: false, resident_id: current_resident.id)
    @interiors = @coordinator.interiors
  end
end
