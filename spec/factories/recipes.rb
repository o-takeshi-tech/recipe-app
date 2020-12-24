FactoryBot.define do
  factory :recipe do
    name                 {"たまごかけごはん"}
    description          {"たまごかけごはんです"}
    association  :user

    after(:build) do |recipe|
      recipe.image.attach(io: File.open('app/assets/images/bakedegg.jpg'), filename: 'bakedegg.jpg')
    end

  end
end
