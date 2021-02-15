class CoordinatorsController < ApplicationController
  before_action :login_required
  
  def show
    @coordinator = Coordinator.find(params[:id])
    @interiors = @coordinator.interiors
    
    if current_resident.present?
      @request = Request.where(status: false).find_by(resident_id: current_resident.id)
      @contract = Contract.find_by(request_id: @request.id)
      @favorites = current_resident.favorites
    end

    if current_coordinator.present?
      @contracts = @coordinator.contracts.where(approval: true)
    end
  end

end
