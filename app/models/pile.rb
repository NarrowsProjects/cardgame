class Pile < ApplicationRecord
  has_many :cards, dependent: :destroy
end
