class FavoritesController < ApplicationController
  def index
    @favorites = Favorites.all
  end

  def create
    favorite = current_resident.favorites.create(interior_id: params[:interior_id])
    redirect_to interiors_url, notice: "#{favorite.interior.coordinator.name}さんのデザインをお気に入り登録しました"
  end
  
  def destroy
    favorite = current_resident.favorites.find_by(id: params[:id]).destroy
    redirect_to interiors_url, notice: "#{favorite.interior.resident.name}さんのデザインをお気に入り解除しました"
  end
end
