class ResidentsController < ApplicationController
  before_action :authenticate_resident!

  def show
    @resident = Resident.find(params[:id])
  end
end
