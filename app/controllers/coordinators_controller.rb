class CoordinatorsController < ApplicationController
    before_action :login_judgement
    
    def show
      @coordinator = Coordinator.find(params[:id])

      @contracts = Contract.find_by(coordinator_id: @coordinator.id)
      @contract = @contracts.find_by(status: 1)
      @requests = current_resident.requests
      
    end
end
