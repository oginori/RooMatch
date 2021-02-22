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
  # describe '一覧表示機能' do
  #   context '一覧画面に遷移した場合' do
  #     it '作成済みのインテリア一覧が表示される' do
  #       login
  #       visit interiors_path
  #       expect(page).to have_selector("img[src$='design01.jpg']")
  #       expect(page).to have_selector("img[src$='design02.jpg']")
  #     end
  #   end
  # end

  # describe '編集機能' do
  #   context '既にあるインテリア作品を編集した場合' do
  #     it '編集した内容に表示が変更されている' do
  #       expect(page).to have_content('')
  #     end
  #   end
  # end

  # describe '削除機能' do
  #   context '現存するインテリア作品を削除した場合' do
  #     it '削除したインテリア作品がマイページから消えている' do
  #       expect(page).not_to have_content('')
  #     end
  #   end
  # end

end