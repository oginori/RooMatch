FactoryBot.define do
  factory :interior do
    design_img { "MyString" }
    date_of_creation { "2021-02-06" }
    budget { 1 }
    description { "MyText" }
    coordinator { nil }
  end
end
