FactoryBot.define do
  factory :message do
    room { nil }
    is_resident { false }
    content { "MyText" }
  end
end
