FactoryBot.define do
  factory :suggestion do
    design_img { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/design01.jpg')) }
    description { "MyText" }
    budget { 100000 }
    contract { nil }
  end
end
