FactoryBot.define do
  factory :request do
    room_size { "MyString" }
    room_img { "MyText" }
    budget { 1 }
    deadline { "2021-02-08" }
    remarks { "MyText" }
    resident { nil }
    coordinator { nil }
  end
end
