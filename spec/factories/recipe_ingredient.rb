FactoryBot.define do
  factory :recipe_ingredient do
    association :recipe
    association :ingredient
  end
end
