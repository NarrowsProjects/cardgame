class User < ApplicationRecord
  has_many :players, dependent: :destroy
  validates :username, :password, presence: true, length: { minimum: 4, maximum: 15 }
  validates :username, uniqueness: true
  validates :password, format: {
    with: /\A(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+\z/,
    message: :invalid_password
  }
end
