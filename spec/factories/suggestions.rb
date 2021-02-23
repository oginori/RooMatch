FactoryBot.define do
  factory :suggestion do
    association :contract
    association :request

    design_img { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/design01.jpg')) }
    description { "MyText" }
    budget { 100000 }
  end
end
