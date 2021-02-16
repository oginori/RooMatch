FactoryBot.define do
  factory :request do
    association :resident

    room_size { "MyString" }
    room_img { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/room01.jpg')) }
    budget { 1 }
    deadline { "2021-02-08" }
    remarks { "MyText" }
    coordinator { nil }
  end
end
