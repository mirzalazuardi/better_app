FactoryBot.define do
  factory :user do
    name Faker::Name.unique.name

    trait :unique_name do
      name { Faker::Name.unique.name }
    end

    trait :with_tasks do
      ignore do
        num 3
      end

      after :create do |user, var|
        create_list :task, var.num, user: user
      end
    end

  end
end
