class ContractsController < ApplicationController
  before_action :login_required
  before_action :set_contract, only: [:edit, :update, :show, :destroy]

  def index
    @contracts = current_coordinator.contracts.where(approval: false)
    flash[:notice] = '依頼はありません' if @contracts.nil?
  end
  
  def create
    if resident_signed_in?
      @coordinator = Coordinator.find(params[:contract][:coordinator_id])

      @contract = Contract.new(contract_params)
      @contract.coordinator_id = params[:contract][:coordinator_id]
      @contract.request_id = params[:contract][:request_id]
      
      if @contract.save!
        redirect_to coordinator_path(@coordinator), notice: '依頼申請をしました'
      else
        redirect_to coordinator_path(@coordinator)
      end
    end

  end

  def edit; end

  def update
    if coordinator_signed_in?
      if current_coordinator.contracts.find_by(status: 'ongoing').nil?
        @coordinator = params[:contract][:coordinator_id]
        @request = Request.find(params[:contract][:request_id])

        @contract.update_attributes(approval: params[:contract][:approval], status: params[:contract][:status])
        @request.update_attributes(coordinator_id: params[:contract][:coordinator_id])
        @room.save!
        redirect_to coordinator_path(@coordinator), notice: '承認しました。取引を開始します。'
      else
        redirect_to contracts_path, alert: '他に取引中のリクエストがあります'
      end
      
    elsif resident_signed_in?
      if @contract.find_by(status: 'ongoing') && params[:contract][:status] == 'close'
        @contract.update_attributes(status: params[:contract][:status])
        redirect_to resident_path(current_resident.id), notice: '取引をクローズしました。'
      end
    end

  end

  def destroy
    @contract.destroy
    redirect_to coordinator_path(@contract.coordinator_id)
  end

  private

  def contract_params
    params.require(:contract).permit(:approval, :status, :request_id, :coordinator_id)
  end

  def set_contract
    @contract = Contract.find(params[:id])
  end

end
