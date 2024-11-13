class Customer < ApplicationRecord
    has_many :subscriptions
    has_many :teas, through: :subscriptions

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: {message: "Email is in use, try another."}
    validates :street_address, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :zip, presence: true, numericality: { message: "Zip must be a number." }
end
