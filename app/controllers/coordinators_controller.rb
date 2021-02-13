class CoordinatorsController < ApplicationController
  before_action :login_required
  
  def show
    @coordinator = Coordinator.find(params[:id])

    @request = Request.find_by(status: false)
    @interiors = @coordinator.interiors
  end
end
