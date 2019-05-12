FactoryBot.define do
  factory :post do
    title 'Lorem ipsum'
    content 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
    is_published false

    trait :published do
      is_published true
    end

    factory :published_post, traits: [:published]
  end
end