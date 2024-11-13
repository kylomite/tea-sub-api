class Tea < ApplicationRecord
  has_many :subscriptions
  has_many :customers, through: :subscriptions

  validates :title, presence: true
  validates :description, presence: true
  validates :temp, presence: true, numericality: { message: "Temp must be a number." }
  validates :brew_time, presence: true, numericality: { message: "Brew_time must be a number." }
  validates :price, presence: true, numericality: { message: "Price must be a number." }
  validates :image, presence: true
end
