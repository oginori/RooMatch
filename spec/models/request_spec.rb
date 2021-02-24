require 'rails_helper'

RSpec.describe 'リクエストモデル', type: :model do

  describe 'バリデーションテスト' do
    it '部屋の画像、部屋のサイズ、予算、希望納期、補足がある場合、有効である' do
      request = FactoryBot.create(:request)
      expect(request).to be_valid
    end
  
    it '部屋の画像がない場合、無効である' do
      request = FactoryBot.build(:request, room_img: nil)
      expect(request).not_to be_valid
    end

    it '部屋のサイズがない場合、無効である' do
      request = FactoryBot.build(:request, room_size: nil)
      expect(request).not_to be_valid
    end

    it '予算がない場合、無効である' do
      request = FactoryBot.build(:request, budget: nil)
      expect(request).not_to be_valid
    end

    it '希望納期がない場合、無効である' do
      request = FactoryBot.build(:request, deadline: nil)
      expect(request).not_to be_valid
    end

    it '補足がない場合、無効である' do
      request = FactoryBot.build(:request, remarks: nil)
      expect(request).not_to be_valid
    end

    it '補足の文字数が1文字以上500文字以内の場合、有効である' do
      request = FactoryBot.build(:request, remarks: "aaaaaaaaaaaaaaaaaaaa")
      expect(request).to be_valid
    end

    it '補足の文字数が500文字より大きい場合、無効である' do
      request = FactoryBot.build(:request, remarks: "a" * 501)
      expect(request).not_to be_valid
    end

    it '予算が0以上の整数である場合、有効である' do
      request = FactoryBot.build(:request, budget: 10000)
      expect(request).to be_valid
    end

    it '予算がマイナスである場合、無効である' do
      request = FactoryBot.build(:request, budget: -1000)
      expect(request).not_to be_valid
    end
  end
end
