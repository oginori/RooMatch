FactoryBot.define do
  factory :contract do
    approval { 1 }
    status { 1 }
    request { nil }
    coordinator { nil }
  end
end
