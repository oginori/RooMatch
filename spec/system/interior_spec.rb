require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
    before do
        FactoryBot.create(:interior)
        FactoryBot.create(:second_interior)
    end
  describe '新規作成機能' do
    context 'インテリアを新規作成した場合' do
      it '作成したインテリアが表示される' do
        @coordinator = Coordinator.find_by(name: 'tanaka')
        visit new_coordinator_session_path
        sign_in @coordinator

        visit new_interior_path
        design_img = find('#interior_design_img')
        design_img.attach_file "app/assets/images/sample/design03.jpg"
        select '2020', from: 'interior[date_of_creation(1i)]'
        select '5月', from: 'interior[date_of_creation(2i)]'
        select '30', from: 'interior[date_of_creation(3i)]'
        fill_in 'interior_budget', with: '100000'
        fill_in 'interior_description', with: 'シンプルで清潔感のある部屋'
        click_button '登録する'
        expect(page).to have_selector("img[src$='design03.jpg']")
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのインテリア一覧が表示される' do
        visit interiors_path
        expect(page).to have_selector("img[src$='design01.jpg']")
        expect(page).to have_selector("img[src$='design02.jpg']")
      end
    end
  end
  describe '詳細表示機能' do
     context '任意のインテリア詳細画面に遷移した場合' do
       it '該当インテリアの内容が表示される' do
       end
     end
  end
end