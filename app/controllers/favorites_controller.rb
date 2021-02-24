class FavoritesController < ApplicationController
  before_action :login_required
  
  def show
    @interiors = current_resident.favorite_interiors
    @favorites = current_resident.favorites
  end

  def create
    favorite = current_resident.favorites.create(interior_id: params[:interior_id])
    redirect_back(fallback_location: root_url)
    flash[:notice] = "#{favorite.interior.coordinator.name}さんのデザインをお気に入り登録しました"
  end
  
  def destroy
    favorite = current_resident.favorites.find_by(id: params[:id])
    favorite.destroy
    redirect_back(fallback_location: root_url)
    flash[:notice] = "#{favorite.interior.coordinator.name}さんのデザインをお気に入り解除しました"
  end
end
