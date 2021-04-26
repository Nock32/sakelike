FactoryBot.define do
  factory :brewer do
    name                  { Faker::Name.name }
    explanation           { Faker::Lorem.characters(number: 10) }
    address               { Faker::Lorem.characters(number: 10) }
    area_id               { 2 }
    association :user
    after(:build) do |brewer|
      brewer.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
