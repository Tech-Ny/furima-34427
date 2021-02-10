require 'faker'

FactoryBot.define do
  factory :item do
    name{Faker::Space.planet}
    describe{Faker::Lorem.sentence}
    price{'1000'}
    category_id{'2'}
    status_id{'2'}
    bearer_id{'2'}
    region_id{'3'}
    delivar_at_id{'3'}
    user_id{'4'}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/TWosmj(1).jpg'), filename: 'test_image.png')
    end

  end
end
