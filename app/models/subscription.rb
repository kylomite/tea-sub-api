class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  validates :customer, presence: true
  validates :tea, presence: true
  validates :frequency, presence: true, numericality: { message: "Frequency must be a number." }

  validates_associated :customer, :tea

  def toggle_active
    self.active = !self.active
  end
end