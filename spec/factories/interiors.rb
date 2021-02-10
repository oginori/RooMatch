FactoryBot.define do
  factory :interior do
    association :coordinator

    design_img { "MyString" }
    date_of_creation { "2021-02-06" }
    budget { 100000 }
    description { "MyText" }
  end

  factory :second_interior, class: Interior do
    association :coordinator
    
    design_img { "design2" }
    date_of_creation { "2021-02-06" }
    budget { 200000 }
    description { "AAAAAA" }
  end
  
end
