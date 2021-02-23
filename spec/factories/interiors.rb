FactoryBot.define do
  factory :interior do
    association :coordinator

    design_img { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/design01.jpg')) }
    date_of_creation { "2021-02-06" }
    budget { 100000 }
    description { "MyText" }
  end

  factory :second_interior, class: Interior do
    association :second_coordinator

    design_img { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/design02.jpg')) }
    date_of_creation { "2021-02-06" }
    budget { 200000 }
    description { "AAAAAA" }
  end
  
  factory :third_interior, class: Interior do
    design_img { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/design03.jpg')) }
    date_of_creation { "2021-02-06" }
    budget { 200000 }
    description { "AAAAAA" }
  end
end
