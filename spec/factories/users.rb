FactoryBot.define do
  factory :user do
    name Faker::Name.unique.name

    trait :unique_name do
      name { Faker::Name.unique.name }
    end

  end
end
