require 'rails_helper'

RSpec.describe '提案モデル', type: :model do
  let!(:coordinator) { FactoryBot.create(:coordinator) }
  let!(:request) { FactoryBot.create(:request) }
  before do
    @suggestion = FactoryBot.build(:suggestion, coordinator_id: coordinator.id, request_id: request.id)
  end

  describe 'バリデーションテスト' do
    it 'デザイン画像、予算、説明がある場合、有効である' do
      expect(@suggestion).to be_valid
    end
  
    it 'デザイン画像がない場合、無効である' do
      @suggestion.design_img = nil
      expect(@suggestion).not_to be_valid
    end

    it '予算がない場合、無効である' do
      @suggestion.budget = nil
      expect(@suggestion).not_to be_valid
    end

    it '説明がない場合、無効である' do
      @suggestion.description = nil
      expect(@suggestion).not_to be_valid
    end

    it '説明の文字数が1文字以上500文字以内の場合、有効である' do
      @suggestion.description = "aaaaaaaaaaaaaaaaaaaa"
      expect(@suggestion).to be_valid
    end

    it '説明の文字数が500文字より大きい場合、無効である' do
      @suggestion.description = "a" * 501
      expect(@suggestion).not_to be_valid
    end
  end
end
