require 'rails_helper'

RSpec.describe 'リクエスト機能', type: :system do
  let!(:request) { FactoryBot.create(:request)}
  let!(:resident_noreq) { FactoryBot.create(:resident_noreq)}
  let!(:coordinator) { FactoryBot.create(:coordinator)}
  def login
      visit new_resident_session_path
      fill_in 'resident[email]', with: 'resident1@example.com'
      fill_in 'resident[password]', with: 'password'
      click_button 'ログインする'
  end

  def login_noreq
    visit new_resident_session_path
    fill_in 'resident[email]', with: 'resident2@example.com'
    fill_in 'resident[password]', with: 'password'
    click_button 'ログインする'
  end

  describe '新規作成機能' do
    context 'レジデントがリクエストを新規作成した場合' do
      it '作成したリクエストが表示される' do
        login_noreq

        visit new_request_path
        attach_file 'request[room_img]', "#{Rails.root}/spec/fixtures/room02.jpg"
        fill_in 'request[room_size]', with: '25平米'
        fill_in 'request[budget]', with: '100000'
        select '2021', from: 'request_deadline_1i'
        select '2月', from: 'request_deadline_2i'
        select '31', from: 'request_deadline_3i'
        fill_in 'request[remarks]', with: '西海岸風のインテリア希望'
        click_button '登録する'
        puts current_url
        expect(page).to have_content("西海岸風のインテリア希望")
      end
    end
  end

  describe '詳細表示機能' do
    context '任意のリクエスト詳細画面に遷移した場合' do
      it '該当リクエストの内容が表示される' do
        login
        visit request_path(request.id)
        expect(page).to have_content 'MyText'
      end
    end
  end

  describe '編集機能' do
    context '既にあるリクエストを編集した場合' do
      it '編集した内容に変更されている' do
        login
        click_on '編集'
        fill_in 'request[remarks]', with: "編集テスト"
        click_on 'commit'
        expect(page).to have_content('編集テスト')
      end
    end
  end

  describe '削除機能' do

    context '取引成立していないインテリア作品を削除した場合' do
      it '削除したインテリア作品がマイページから消えている' do
        request.remarks = "削除テスト"
        login
        click_on '削除'
        accept_confirm
        expect(page).not_to have_content(request.id)
      end
    end

    context '取引成立しているインテリア作品を削除した場合' do
      it '削除したインテリア作品がマイページから消えない' do
        @contract = Contract.new(request_id: request.id, coordinator_id: coordinator.id, status: "ongoing", approval: true )
        @contract.save
        request.remarks = "削除テスト"
        request.coordinator_id = coordinator.id
        request.save

        login
        click_on '削除'
        accept_confirm
        expect(page).to have_content(request.id)
      end
    end

    context 'リクエストが完了しているインテリア作品を削除した場合' do
        it '削除したインテリア作品がマイページから消えない' do
          @contract = Contract.new(request_id: request.id, coordinator_id: coordinator.id, status: "close", approval: true )
          @contract.save
          request.remarks = "削除テスト"
          request.status = true
          request.coordinator_id = coordinator.id
          request.save
  
          login
          click_on '削除'
          accept_confirm
          expect(page).to have_content(request.id)
        end
      end
  end
end