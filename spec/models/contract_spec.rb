require 'rails_helper'

RSpec.describe '取引モデル機能', type: :model do
  let!(:resident) { FactoryBot.create(:resident) }
  let!(:coordinator) { FactoryBot.create(:coordinator) }

  describe 'バリデーションのテスト' do
    context '以前に取引していないリクエストとコーディネーターの組み合わせの場合' do
      it 'バリデーションが通る' do
        
      end
    end

    context '既に同じリクエストとコーディネーターの組み合わせがある場合' do
      it 'バリデーションにひっかかる' do

        contract = Contract.new(status: 'ongoing', request_id: 1, coordinator_id: 1, approval: true )


        visit coordinator_path(@coordinator.id)
        expect(page).to have_content("依頼する")
      end
    end
  end
end