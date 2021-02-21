require 'rails_helper'

RSpec.describe 'メッセージモデル機能', type: :model do

  let!(:coordinator) { FactoryBot.create(:coordinator) }
  let!(:request) { FactoryBot.create(:request) }

  before do
    @contract = FactoryBot.create(:contract, status: "ongoing", approval: true, coordinator_id: coordinator.id, request_id: request.id)
    @room = FactoryBot.create(:room, resident_id: request.resident_id, coordinator_id: @contract.coordinator_id, contract_id: @contract.id)
  end


  describe 'バリデーションのテスト' do
    context 'ルームid、送信者id、メッセージ内容がある場合' do
      it 'バリデーションが通る' do
        # @contract = FactoryBot.create(:contract, status: "ongoing", approval: true, coordinator_id: coordinator.id, request_id: request.id)
        # @room = FactoryBot.create(:room, resident_id: request.resident_id, coordinator_id: @contract.coordinator_id, contract_id: @contract.id)
        @message = Message.create(room_id: @room.id, is_resident: false, content: "aaa", sender_id: coordinator.id)
        expect(@message).to be_valid
      end
    end

    context 'ルームidがない場合' do
      it 'バリデーションにひっかかる' do
        @message = Message.create(room_id: nil, is_resident: false, content: "aaa", sender_id: coordinator.id)
        expect(@message).not_to be_valid
      end
    end

    context '送信者idがない場合' do
      it 'バリデーションにひっかかる' do
        @message = Message.create(room_id: @room.id, is_resident: false, content: "aaa", sender_id: nil)
        expect(@message).not_to be_valid
      end
    end

    context 'メッセージ内容がない場合' do
      it 'バリデーションにひっかかる' do
        @message = Message.create(room_id: @room.id, is_resident: false, content: nil, sender_id: coordinator.id)
        expect(@message).not_to be_valid
      end
    end
    
    context 'メッセージ内容が1文字以上500文字以内の場合' do
      it 'バリデーションが通る' do
        @message = Message.create(room_id: @room.id, is_resident: false, content: "a" * 500, sender_id: coordinator.id)
        expect(@message).to be_valid
      end
    end

    context 'メッセージ内容が500文字より多い場合' do
      it 'バリデーションにひっかかる' do
        @message = Message.create(room_id: @room.id, is_resident: false, content: "a" * 501, sender_id: coordinator.id)
        expect(@message).not_to be_valid
      end
    end
  end
end