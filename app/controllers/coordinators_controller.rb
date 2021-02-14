class CoordinatorsController < ApplicationController
  before_action :login_required
  
  def show
    @coordinator = Coordinator.find(params[:id])

    @request = Request.where(status: false).find_by(resident_id: current_resident.id)
    @contract = Contract.find_by(request_id: @request.id)
    @interiors = @coordinator.interiors
    @favorites = current_resident.favorites
  end
end
