FactoryBot.define do
  factory :currency do
    title { "NewCurrency" }
    previous_rate { 0.0 }
    current_rate { 1.0 }
    force_rate { 1.2 }
    tomorrow_rate { 1.5 }
    force_end_time { "2020-01-01 00:00:00" }

    trait :invalid do
      force_rate { -2 }
      force_end_time { 'invalid format' }
    end

    factory :currencies_list do
      sequence(:title) do |n|
        "Currency-#{n}"
      end

      sequence(:current_rate) do |n|
        "#{n + 2.5}"
      end

      sequence(:tomorrow_rate) do |n|
        "#{n + 3}"
      end
    end
  end
end
