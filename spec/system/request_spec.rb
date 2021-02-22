require 'rails_helper'
describe 'リクエスト機能', type: :system do
  describe '新規作成機能' do
    context 'レジデントがリクエストを新規作成した場合' do
      it '作成したリクエストが表示される' do
      end
    end
  end

  describe '詳細表示機能' do
    context '任意のリクエスト詳細画面に遷移した場合' do
      it '該当リクエストの内容が表示される' do
        visit request_path(request.id)
        expect(page).to have_content 'task'
      end
    end
  end

  describe '編集機能' do
    context '既にあるインテリア作品を編集した場合' do
      it '編集した内容に表示が変更されている' do
        expect(page).to have_content('')
      end
    end
  end

  describe '削除機能' do
    context '現存するインテリア作品を削除した場合' do
      it '削除したインテリア作品がマイページから消えている' do
        expect(page),not_to have_content('')
      end
    end
  end

end