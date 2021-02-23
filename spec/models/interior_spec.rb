require 'rails_helper'

RSpec.describe 'インテリアモデル', type: :model do

  describe 'バリデーションテスト' do
    it 'デザイン画像、作成日、予算、説明がある場合、有効である' do
      interior = FactoryBot.create(:interior)
      expect(interior).to be_valid
    end
  
    it 'デザイン画像がない場合、無効である' do
      interior = FactoryBot.build(:interior, design_img: nil)
      expect(interior).not_to be_valid
    end

    it '作成日がない場合、無効である' do
      interior = FactoryBot.build(:interior, date_of_creation: nil)
      expect(interior).not_to be_valid
    end

    it '予算がない場合、無効である' do
      interior = FactoryBot.build(:interior, budget: nil)
      expect(interior).not_to be_valid
    end

    it '説明がない場合、無効である' do
      interior = FactoryBot.build(:interior, description: nil)
      expect(interior).not_to be_valid
    end

    it '説明の文字数が1文字以上255文字以内の場合、有効である' do
      interior = FactoryBot.build(:interior, description: "aaaaaaaaaaaaaaaaaaaa")
      expect(interior).to be_valid
    end

    it '説明の文字数が255文字より大きい場合、無効である' do
      interior = FactoryBot.build(:interior, description: "a" * 256)
      expect(interior).not_to be_valid
    end
  end
end
