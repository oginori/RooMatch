require 'rails_helper'
RSpec.describe '取引管理機能', type: :system do
  let!(:interior) { FactoryBot.create(:interior) }
  let!(:request) { FactoryBot.create(:request) }

  describe 'レジデントの依頼機能' do
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

  describe 'コーディネーターの承認否認機能' do
    context 'コーディネーターが他に取引をしていないとき' do
      it 'レジデントの依頼を承認することができる' do
        @coordinator = Coordinator.find_by(name: 'coordinator1')
        Contract.create(request_id: request.id, coordinator_id: @coordinator.id, approval:false, status:nil )
        sign_in @coordinator

        visit contracts_path
        click_on '承認'
        expect(page).to have_content('取引中')
      end
    end
    
    context 'コーディネーターが他に取引をしているとき' do
      it 'レジデントの依頼を承認することができない' do
        @coordinator = Coordinator.find_by(name: 'coordinator1')
        @resident = FactoryBot.create(:resident, email: 'aaa@xxx.com')

        @other_request = FactoryBot.create(:second_request, coordinator_id: @coordinator.id, resident_id: @resident.id )
        Contract.create(request_id: @other_request.id, coordinator_id: @coordinator.id, approval:true, status: 'ongoing' )
        Contract.create(request_id: request.id, coordinator_id: @coordinator.id, approval:false, status:nil )

        sign_in @coordinator
        visit contracts_path
        click_on '承認'
        expect(page).to have_content('他に取引中のリクエストがあります')
      end
    end

    context 'コーディネーターが否認ボタンをおしたとき' do
      it 'レジデントのリクエストは否認される' do
        @coordinator = Coordinator.find_by(name: 'coordinator1')
        Contract.create(request_id: request.id, coordinator_id: @coordinator.id, approval:false, status:nil )
        
        sign_in @coordinator
        visit contracts_path
        click_on '否認'
        accept_confirm
        expect(page).to have_content('依頼を否認しました')
      end
    end
  
  end
end