FactoryBot.define do
  factory :user do
    sequence :email do |n|
        "nobody-#{n}@example.com"
    end

    sequence :subdomain do |n|
      "blog#{n}"
    end

    password 'kahjad7fdas8ufafds'
    password_confirmation 'kahjad7fdas8ufafds'
  end
end