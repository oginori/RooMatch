FactoryBot.define do
  factory :request do
    association :resident

    room_size { "25平米" }
    room_img { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/room01.jpg')) }
    budget { 1 }
    deadline { "2021-02-08" }
    remarks { "MyText" }
    coordinator { nil }
    status { false }
  end

  factory :second_request, class: Request do
    room_size { "20平米"}
    room_img { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/room03.jpg')) }
    budget  { 10000 }
    deadline { "2021-05-08" }
    remarks { "AAA" }
    coordinator { nil }
    status { false }
    resident_id { nil }
  end
end
