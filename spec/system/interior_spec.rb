require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
    before do
        FactoryBot.create(:interior)
        FactoryBot.create(:second_interior)
    end
  describe '新規作成機能' do
    context 'インテリアを新規作成した場合' do
      it '作成したインテリアが表示される' do
        visit new_interior_path
        attach_file 'design img', "app/assets/images/sample/design01.jpg"
        fill_in 'date_of_creation', '2020/11/10'
        fill_in 'budget', with: 100000
        fill_in 'description', with: 'シンプルで清潔感のある部屋'
        click_button 'submit'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのインテリア一覧が表示される' do
        interior = FactoryBot.create(:interior, design_img: 'first')
        visit interiors_path
        expect(page).to have_content 'first'
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