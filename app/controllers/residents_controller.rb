class ResidentsController < ApplicationController
  before_action :login_required

  def show
    @resident = Resident.find(params[:id])
    @requests = @resident.requests
  end
end
