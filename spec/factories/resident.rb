FactoryBot.define do
  factory :resident do
    name {"resident1"}
    user_name {"resident1"}
    email { "resident1@example.com"}
    password {"password"}
    sex {1}
    birthday {"1985/12/30"}
  end

  factory :resident_noreq, class: Resident do
    name {"resident2"}
    user_name {"resi2"}
    email {"resident2@example.com"}
    password {"password"}
    sex {2}
    birthday {"1994/05/30"}
  end
  end
  