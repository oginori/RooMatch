class ContractsController < ApplicationController
  before_action :login_judgement
  before_action :set_request, only: [:edit, :update, :show]

  def index

  end

  def new
  end
  
  def create
  end

  def edit
  end

  def update
  end

  private

  def contract_params
    params.require(:contract).permit(:approval, :status, :request_id, :coordinator_id)
  end

  def set_contract
    @contract = Contract.find(params[:id])
  end

end
