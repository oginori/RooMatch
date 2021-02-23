FactoryBot.define do
  factory :contract do
    approval { false }
    status { 1 }
    request { nil }
    coordinator { nil }
  end
end
