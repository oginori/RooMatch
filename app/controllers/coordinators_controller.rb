class CoordinatorsController < ApplicationController
    before_action :authenticate_coordinator!
    def show
      @coordinator = Coordinator.find(params[:id])
    end
end
