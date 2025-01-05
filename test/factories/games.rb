FactoryBot.define do
  factory :game do
    sequence(:name) { |n| "Game #{n}" }
    playercount { 4 }
    status { "Waiting_for_players" }
    online { false }

    association :play_pile, factory: :pile
    association :stock_pile, factory: :pile

    after(:create) do |game|
      game.current_player ||= FactoryBot.create(:player, game:)
    end
  end
end
