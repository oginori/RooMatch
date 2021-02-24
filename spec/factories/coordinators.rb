FactoryBot.define do
  factory :coordinator do
    name {"coordinator1"}
    user_name {"coordinator1"}
    email {"test@example.com"}
    password {"password"}
    sex {1}
    birthday {"1998/11/30"}
    occupation {"artist"}
    profile_img {nil}
  end

  factory :second_coordinator, class: Coordinator do
    name {"coordinator2"}
    user_name {"coordinator2"}
    email {"test2@example.com"}
    password {"password"}
    sex {2}
    birthday {"1978/09/30"}
    occupation {"student"}
    profile_img {nil}
  end

  factory :third_coordinator, class: Coordinator do
    name {"coordinator3"}
    user_name {"coordinator3"}
    email {"test3@example.com"}
    password {"password"}
    sex {3}
    birthday {"1987/02/05"}
    occupation {"doctor"}
    profile_img {nil}
  end
end
