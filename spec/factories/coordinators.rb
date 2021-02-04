FactoryBot.define do
  factory :coordinator do
    name {"tanaka"}
    user_name {"ttt"}
    sequence(:email) { |n| "hiro#{n}@example.com"}
    password {"password"}
    sex {1}
    birthday {"1998/11/30"}
    occupation {"artist"}
  end
end
