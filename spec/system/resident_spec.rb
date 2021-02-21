require 'rails_helper'
describe 'レジデント機能', type: :system do
  let!(:resident) { FactoryBot.create(:resident)}

  describe 'レジデント登録のテスト' do
    context 'レジデントを新規登録した場合' do
      it 'レジデントのマイページが表示される' do
        visit new_resident_path
        fill_in 'resident_name', with: '田中 太郎'
        choose 'resident_sex_male'
        fill_in 'resident_user_name', with: 'tanaka'
        fill_in 'resident_email', with: 'tanaka@example.com'
        fill_in 'resident_password', with: 'password'
        fill_in 'resident_password_confirmation', with: 'password'
        click_on 'commit'
        expect(page).to have_content 'tanaka'
      end
    end

    context 'ログインせずインテリア一覧画面に飛ぼうとした場合' do
      it 'ログイン画面に遷移する' do
        visit interiors_path
        expect(page).to have_current_path tops_path
      end
    end
  end

  describe 'セッション機能のテスト' do
    context 'レジデントがログインした場合' do
      it 'マイページに遷移し、ログイン成功の文言が表示される' do
        visit new_resident_session_path
        fill_in 'resident_session_email', with: resident.email
        fill_in 'resident_session_password', with: resident.password
        click_on 'commit'
        expect(page).to have_content 'resident1のページ'
        expect(page). to have_content 'ログインしました'
      end
    end

    context 'レジデントがログアウトした場合' do
      it 'トップページに遷移し、ログアウト成功の文言が表示される' do
        visit new_resident_session_path
        fill_in 'resident_session_email', with: resident.email
        fill_in 'resident_session_password', with: resident.password
        click_on 'commit'
        click_on 'Logout'
        expect(page).to have_current_path tops_path
        expect(page).to have_content 'ログアウトしました。'
      end
    end
  end
end