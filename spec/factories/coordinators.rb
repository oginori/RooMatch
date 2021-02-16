FactoryBot.define do
  factory :coordinator do
    name {"coordinator1"}
    user_name {"coordinator1"}
    sequence(:email) { |n| "coor#{n}@example.com"}
    password {"password"}
    sex {1}
    birthday {"1998/11/30"}
    occupation {"artist"}
  end
end
