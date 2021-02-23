require 'rails_helper'
RSpec.describe 'インテリア機能', type: :system do
  let!(:second_coordinator) { FactoryBot.create(:second_coordinator) }

  def login
    visit new_coordinator_session_path
    fill_in 'coordinator[email]', with: 'test2@example.com'
    fill_in 'coordinator[password]', with: 'password'
    click_button 'ログインする'
  end

  describe '新規作成機能' do
    context 'コーディネーターがインテリアを新規作成した場合' do
      it '作成したインテリアが表示される' do
        login
        visit new_interior_path
        attach_file 'interior[design_img]', "#{Rails.root}/spec/fixtures/design03.jpg"
        select '2020', from: 'interior[date_of_creation(1i)]'
        select '5月', from: 'interior[date_of_creation(2i)]'
        select '30', from: 'interior[date_of_creation(3i)]'
        fill_in 'interior_budget', with: '100000'
        fill_in 'interior_description', with: 'シンプルで清潔感のある部屋'
        click_button '登録する'
        puts current_url
        expect(page).to have_content("シンプルで清潔感のある部屋")
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのインテリア一覧が表示される' do
        FactoryBot.create(:third_interior, coordinator_id: second_coordinator.id, description: "一覧画面テスト")
        login
        visit interiors_path
        expect(page).to have_content("一覧画面テスト")
      end
    end
  end

  describe '編集機能' do
    context '既にあるインテリア作品を編集した場合' do
      it '編集した内容に表示が変更されている' do
        FactoryBot.create(:third_interior, coordinator_id: second_coordinator.id)
        login
        click_on '編集'
        fill_in 'interior[description]', with: '編集テスト'
        click_button 'commit'
        expect(page).to have_content('インテリア作品を更新しました')
        expect(page).to have_content('編集テスト')
      end
    end
  end

  describe '削除機能' do
    context '現存するインテリア作品を削除した場合' do
      it '削除したインテリア作品がマイページから消えている' do
        FactoryBot.create(:interior)
        FactoryBot.create(:third_interior, coordinator_id: second_coordinator.id, description: '削除テスト')
        login
        click_on '削除'
        accept_confirm
        expect(page).to have_content('インテリア作品を削除しました')
        expect(page).not_to have_content('削除テスト')
      end
    end
  end

  describe '無限スクロール機能' do
    before do
      10.times do |n|
        FactoryBot.create(:third_interior, coordinator_id: second_coordinator.id, description: "デザイン画像#{n + 1}",)
      end
      FactoryBot.create(:interior, description: "最後のデザイン画像")
    end
    context 'インテリア一覧にてスクロールした場合' do
      
      it '一番下まで到達した際、さらに画像が表示される' do
        login
        visit interiors_path
        binding.irb
        execute_script('window.scrollBy(0,10000)')
        expect(page).to have_content('最後の画像')
      end
    end
  end

end