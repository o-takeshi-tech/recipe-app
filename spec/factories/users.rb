FactoryBot.define do
  factory :user do
    username               {"たけし"}
    email                  {"hoge@hoge"}
    password               {"hoge1111"}
    password_confirmation  {password}
  end
end
