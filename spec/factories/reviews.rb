FactoryBot.define do
  factory :review do
    title             { Faker::Name.name }
    content           { Faker::Lorem.characters(number: 10) }
    association :user
    association :item
  end
end
