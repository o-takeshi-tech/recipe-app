FactoryBot.define do
  factory :user do
    username               { 'たけし' }
    email                  { 'hoge1@hoge' }
    password               { 'hoge1111' }
    password_confirmation  { password }
  end
end
