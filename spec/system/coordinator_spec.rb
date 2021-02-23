require 'rails_helper'
describe 'コーディネーター機能', type: :system do
  let!(:resident) { FactoryBot.create(:resident)}

  describe 'コーディネーター登録のテスト' do
    context 'コーディネーターを新規登録した場合' do
      it 'コーディネーターのマイページが表示される' do
        visit new_coordinator_registration_path
        fill_in 'coordinator_name', with: '佐藤 一'
        choose 'coordinator_sex_male'
        select '1997', from: 'coordinator_birthday_1i'
        select '8', from: 'coordinator_birthday_2i'
        select '5', from: 'coordinator_birthday_3i'
        fill_in 'coordinator_occupation', with: '学生'
        fill_in 'coordinator_user_name', with: 'satou'
        fill_in 'coordinator_email', with: 'satou@example.com'
        fill_in 'coordinator_password', with: 'password'
        fill_in 'coordinator_password_confirmation', with: 'password'
        click_on '登録する'
        expect(page).to have_content 'satou'
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
        fill_in 'resident_email', with: resident.email
        fill_in 'resident_password', with: resident.password
        click_on 'ログインする'
        expect(page).to have_content 'resident1'
        expect(page). to have_content 'ログインしました'
      end
    end

    context 'レジデントがログアウトした場合' do
      it 'トップページに遷移し、ログアウト成功の文言が表示される' do
        visit new_resident_session_path
        fill_in 'resident_email', with: resident.email
        fill_in 'resident_password', with: resident.password
        click_on 'ログインする'
        click_on 'ログアウト'
        expect(page).to have_current_path tops_path
        expect(page).to have_content 'ログアウトしました。'
      end
    end
  end
end