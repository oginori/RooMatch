class ContractsController < ApplicationController
  before_action :login_required
  before_action :set_contract, only: [:edit, :update, :show, :destroy]

  def index
    @contracts = Contract.find_by(id: current_coordinator)
    flash[:notice] = '依頼はありません' if @contracts.nil?
  end

  # def new
  #   @contract = Contract.new
  # end
  
  def create
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

  def edit; end

  def update
    if param[:approval][:status]
      @contract.update_attibutes(param[:approval][:status])
      render :new, notice: '承認しました。取引を開始します。'
    elsif param[:status]
      @contract.update_attibutes(param[:status])
   　 render :new, notice: '取引をクローズしました。'
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
