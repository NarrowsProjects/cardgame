FactoryBot.define do
  factory :card do
    association :pile, factory: :pile
    suit { %w[Hearts Diamonds Clubs Spades].sample }
    weight { Faker::Number.between(from: 2, to: 14) } # 2-10, Jack = 11, Queen = 12, King = 13, Ace = 14

    transient do
      deck_count { 1 }
    end

    sequence(:position) { |n| ((n - 1) % (52 * deck_count)) + 1 }
  end
end
