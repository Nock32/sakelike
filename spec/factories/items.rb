FactoryBot.define do
  factory :item do
    name               { Faker::Name.name }
    explanation        { Faker::Lorem.characters(number: 10) }
    association :user
    association :brewer
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
