class CoordinatorsController < ApplicationController
  before_action :login_required
  
  def show
    @coordinator = Coordinator.find(params[:id])
    @interiors = @coordinator.interiors
    
    if resident_signed_in?
      @request = Request.where(status: false).find_by(resident_id: current_resident.id)
      if @request.present?
        @contract = Contract.find_by(request_id: @request.id)
      end
      @favorites = current_resident.favorites
    end

    if coordinator_signed_in?
      @contracts = @coordinator.contracts.where(approval: true)
    end
  end

end
