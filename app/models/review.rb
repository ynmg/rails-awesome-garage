class Review < ApplicationRecord
  belongs_to :car

  validates :car_id, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: 0..5, message: "must be between 0 and 5" }
  validates :comment, presence: true, length: { minimum: 6 }
end
