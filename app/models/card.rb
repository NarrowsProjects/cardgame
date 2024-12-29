class Card < ApplicationRecord
  belongs_to :pile

  enum :suit, { Hearts: 'Hearts', Diamonds: 'Diamonds', Clubs: 'Clubs', Spades: 'Spades' }, _prefix: true
  validates :suit, inclusion: { in: suits.keys }
end
