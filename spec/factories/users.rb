FactoryBot.define do
  factory :user do
    nickname              {"aaaaaa"}
    email                 { "aaa@test" }
    password              {"aaa000"}
    password_confirmation {password}
    last_name             {"ああああ"}          
    first_name            {"ああああ"}
    last_name_kana        {"アアアア"}
    first_name_kana       {"アアアア"}
    birthday              {"1950/1/1"}
  end
end
