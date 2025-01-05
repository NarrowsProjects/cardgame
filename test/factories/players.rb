FactoryBot.define do
  factory :player do
    association :user
    association :game, factory: :game

    association :hand_pile, factory: :pile
    association :face_down_pile, factory: :pile
    association :face_up_pile, factory: :pile
  end
end
