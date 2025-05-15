class Owner < ApplicationRecord
  has_many :cars

  validates :nickname, presence: true
end
