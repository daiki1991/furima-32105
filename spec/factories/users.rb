FactoryBot.define do
  factory :user do
    nickname              {"aaaaaa"}
    email                 {"aaaa@aaaa"}
    password              {"000000"}
    password_confirmation {password}
    last_name             {"aaaa"}          
    first_name            {"aaaa"}
    last_name_kana        {"aaaa"}
    first_name_kana       {"aaaa"}
    birthday              {"1950/1/1"}
  end
end
