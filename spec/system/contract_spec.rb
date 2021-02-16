require 'rails_helper'
RSpec.describe '取引管理機能', type: :system do
  before do
    FactoryBot.create(:interior)
    FactoryBot.create(:request)
  end
  describe '依頼機能' do
    context 'レジデントがリクエストを作成している場合' do
      it 'コーディネーターに依頼することができる' do
        @resident = Resident.find_by(name: 'resident1')
        @coordinator = Coordinator.find_by(name: 'coordinator1')
        sign_in @resident

        visit coordinator_path(@coordinator.id)
        expect(page).to have_content("依頼する")
    end
  end

    context 'レジデントがリクエストを作成していない場合' do
      it 'リクエスト作成を求められる' do
        @resident = FactoryBot.create(:resident_noreq)
        @coordinator = Coordinator.find_by(name: 'coordinator1')
        sign_in @resident

        visit coordinator_path(@coordinator.id)
        expect(page).to have_content('リクエストを作成してからの申請となります')
      end
    end
  end
end