require 'rails_helper'
describe 'お気に入り機能', type: :system do
  let!(:resident) { FactoryBot.create(:resident) }
  let!(:interior) { FactoryBot.create(:interior) }
  
  describe 'レジデントがインテリアをお気に入り登録をした場合' do
    before do
      sign_in resident
    end
    it 'お気に入り登録のメッセージが表示され、お気に入り中を表す文言が表示される' do
      visit interiors_path
      click_on 'fav! fav!'
      expect(page).to have_content 'お気に入り登録しました'
      expect(page).to have_content 'remove-fav?'
    end

    it 'お気に入り一覧に、お気に入りしたインテリアが表示される' do
      interior.description = 'just_favorite_interior'
      interior.save
      visit interiors_path
      click_on 'fav! fav!'
      visit favorite_path(resident.id)
      expect(page).to have_content 'just_favorite_interior'
    end
  end

  describe 'レジデントがインテリアのお気に入り登録を外した場合' do
    before do
      sign_in resident
      visit interiors_path
      click_on 'fav! fav!'
    end

    it 'お気に入り解除のメッセージが表示され、インテリアに対し、お気に入りしていない際の文言が表示される' do
      visit interiors_path
      click_on 'remove-fav?'
      expect(page).to have_content 'お気に入り解除しました'
      expect(page).to have_content 'fav! fav!'
    end

    it 'お気に入り一覧から、お気に入り解除したインテリアがなくなる' do
      interior.description = 'just_unfavorite_interior'
      visit interiors_path
      click_on 'remove-fav?'
      visit favorite_path(resident.id)
      expect(page).not_to have_content 'just_unfavorite_interior'
    end
  end
end