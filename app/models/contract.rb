class Contract < ApplicationRecord
  belongs_to :request
  belongs_to :coordinator
  has_one :suggestion, dependent: :destroy
  has_one :room, dependent: :destroy

  validates :coordinator_id, uniqueness: { scope: :request_id }
  validates :status, uniqueness: { scope: :coordinator_id }, if: :ongoing_already_exist?

  def ongoing_already_exist?
    Contract.where(coordinator_id: current_coordinator.id, status: 'ongoing').present?
  end

  enum status: { ongoing: 1, close: 2 }
end
