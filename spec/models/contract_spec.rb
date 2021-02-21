require 'rails_helper'

RSpec.describe '取引モデル機能', type: :model do
  let!(:coordinator) { FactoryBot.create(:coordinator) }
  let!(:request) { FactoryBot.create(:request) }
  describe 'バリデーションのテスト' do
    context '以前に取引していないリクエストとコーディネーターの組み合わせの場合' do
      it 'バリデーションが通る' do
        contract = FactoryBot.build(:contract, request_id: request.id, coordinator_id: coordinator.id)
        expect(contract).to be_valid
      end
    end

    context '既に同じリクエストとコーディネーターの組み合わせがある場合' do
      it 'バリデーションにひっかかる' do
       contract1 = FactoryBot.create(:contract, request_id: request.id, coordinator_id: coordinator.id)
       contract2 = FactoryBot.build(:contract, request_id: request.id, coordinator_id: coordinator.id)
       expect(contract2).not_to be_valid
      end
    end
  end
end