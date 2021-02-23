require 'rails_helper'
RSpec.describe 'メッセージ機能', type: :system do
  let!(:coordinator) { FactoryBot.create(:coordinator) }
  let!(:request) { FactoryBot.create(:request) }

  def login_as_coordinator
    visit new_coordinator_session_path
    fill_in 'coordinator[email]', with: 'test@example.com'
    fill_in 'coordinator[password]', with: 'password'
    click_button 'ログインする'
  end

  def login_as_resident
    visit new_resident_session_path
    fill_in 'resident[email]', with: 'resident1@example.com'
    fill_in 'resident[password]', with: 'password'
    click_button 'ログインする'
  end

  describe 'チャットルーム機能' do
    context '取引が成立している場合' do
      it 'チャットルームへ移動できる' do
        contract = Contract.new(coordinator_id: coordinator.id, request_id: request.id, status: "ongoing", approval: true )
        contract.save
        
        login_as_coordinator
        click_on 'チャットを開始する'
        expect(page).to have_content 'チャットルーム'
      end
    end

    context '取引が成立していない場合' do
        it 'チャットルームの表示が現れない' do
          contract = Contract.new(coordinator_id: coordinator.id, request_id: request.id, status: nil, approval: false )
          contract.save
          
          login_as_coordinator
          expect(page).not_to have_content 'チャットを開始する'

        end
      end
  end

  describe 'チャットメッセージ送受信機能' do
    context '新規メッセージを送信した場合' do
      it '自分が投稿したメッセージが表示される' do
        contract = Contract.new(coordinator_id: coordinator.id, request_id: request.id, status: "ongoing", approval: true )
        contract.save

        login_as_coordinator
        click_on 'チャットを開始する'
        fill_in 'message[content]', with: '初メッセージ'
        click_on 'commit'
        expect(page).to have_content("初メッセージ")  
      end
    end

    context '取引相手からメッセージが送られた場合' do
      it '相手が送信したメッセージが表示される' do
        contract = Contract.new(coordinator_id: coordinator.id, request_id: request.id, status: "ongoing", approval: true )
        contract.save
        resident = request.resident
        room = Room.new(resident_id: resident.id, coordinator_id: coordinator.id, contract_id: contract.id)
        room.save
        message = Message.new(room_id: room.id, is_resident: false, content: 'hey!', sender_id: coordinator.id)
        message.save

        login_as_resident
        click_on 'チャットルームへ'
        expect(page).to have_content("hey!")
      end
    end
  end

end