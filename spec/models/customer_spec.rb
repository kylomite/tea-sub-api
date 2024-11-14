require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'associations' do
    it {should have_many(:teas).through(:subscriptions)}
    it {should have_many(:subscriptions)}
  end

  describe 'validations' do
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:street_address)}
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:state)}
    it {should validate_presence_of(:zip)}


    it 'validates the numericality of zip' do
      customer = Customer.new(
        first_name: "Monkey",
        last_name: "Luffy",
        email: "mluffy@aol.com",
        street_address: "1738",
        city: "Fosha Village",
        state: "East Blue",
        zip: "swag"
      )

      expect(customer).not_to be_valid
      expect(customer.errors[:zip]).to include("Zip must be a number.")
    end

    it 'validates the uniqueness of email' do
      customer1 = Customer.create!(
        first_name: "Monkey",
        last_name: "Luffy",
        email: "mluffy@aol.com",
        street_address: "1738",
        city: "Fosha Village",
        state: "East Blue",
        zip: 17171
      )
      customer2 = Customer.new(
        first_name: "Vinsmoke",
        last_name: "Sanji",
        email: "mluffy@aol.com",
        street_address: "1234",
        city: "Baratie",
        state: "North Blue",
        zip: 38383
      )

      expect(customer2).not_to be_valid
      expect(customer2.errors[:email]).to include("Email is in use, try another.")
    end
  end
end
