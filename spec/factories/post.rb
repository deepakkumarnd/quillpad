FactoryBot.define do
  factory :post do
    title 'Lorem ipsum'
    content 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
    is_published false
    kind 'default'

    trait :published do
      is_published true
    end

    trait :secure do
      kind 'secure'
    end

    factory :published_post, traits: [:published]
    factory :secure_post, traits: [:secure]
  end
end
