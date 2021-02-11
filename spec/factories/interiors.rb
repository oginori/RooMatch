FactoryBot.define do
  factory :interior do
    association :coordinator

    design_img { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/sample/design01.jpg')) }
    date_of_creation { "2021-02-06" }
    budget { 100000 }
    description { "MyText" }
  end

  factory :second_interior, class: Interior do
    association :coordinator

    design_img { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/sample/design02.jpg')) }
    date_of_creation { "2021-02-06" }
    budget { 200000 }
    description { "AAAAAA" }
  end
  
end
