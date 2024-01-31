FactoryBot.define do
  factory :potato_price do
    factory :pp_without_amount do
      amount { "" }
      price_at { "2024-01-31 08:54:59" }
    end

    factory :pp_amount_string do
      amount { "string" }
      price_at { "2024-01-31 08:54:59" }
    end

    factory :pp_amount_big do
      amount { "10_000" }
      price_at { "2024-01-31 08:54:59" }
    end

    factory :pp_amount_low do
      amount { "0" }
      price_at { "2024-01-31 08:54:59" }
    end

    factory :pp_without_date do
      amount { "9.99" }
      price_at { "" }
    end

    factory :pp_normal do
      amount { "9.99" }
      price_at { "2024-01-31 08:54:59" }
    end

    factory :pp_valid do
      amount { "5.25" }
      price_at { "2024-01-30 08:54:59" }
    end

    factory :pp_same_date do
      amount { "5.26" }
      price_at { "2024-01-30 23:00:00" }
    end
  end
end
