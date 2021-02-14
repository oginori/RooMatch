class SuggestionsController < ApplicationController
  before_action :set_suggestion, only: [:edit, :update, :show, :destroy]

  def new
    @suggestion = Suggestion.new
    @ongoing_case = current_coordinator.contracts.find_by(status: 1)
  end

  def create
    @suggestion = current_coordinator.suggestions.build(suggestion_params)
    if @suggestion.save
      redirect_to suggestion_path(@suggestion.id), notice: 'suggestion was successfully created'
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:design_img, :design_image_cache, :description, :budget, :contract_id, :coordinator_id)
  end

  def set_suggestion
    @suggestion = Suggestion.find(params[:id])
  end

end
