FactoryBot.define do
  factory :message do
    association :room

    is_resident { false }
    content { "MyText" }
  end
end
