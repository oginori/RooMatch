FactoryBot.define do
  factory :room do
    association :contract
    association :resident
    association :coordinator
  end
end
