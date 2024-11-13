require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'associations' do
    it {should belong_to(:customer)}
    it {should belong_to(:tea)}
  end
  
  describe 'validations' do
    it {should validate_presence_of(:customer)}
    it {should validate_presence_of(:tea)}
    it {should validate_presence_of(:active)}
    it {should validate_presence_of(:frequency)}

    it 'validates numericality of frequency' do
      customer1 = Customer.new(
        first_name: "Monkey",
        last_name: "Luffy",
        email: "mluffy@aol.com",
        street_address: "1738",
        city: "Fosha Village",
        state: "East Blue",
        zip: 17171
      )
  
      tea1 = Tea.new(
        title: "Germa 66's Green Tea",
        description: "Germa 66, the technologically advanced and militaristic organization from One Piece, is known for its precision and superior craftsmanship, and their green tea is no exception. This carefully crafted blend combines the finest handpicked leaves from the hidden tea gardens of the North Blue, known for their rich, vibrant flavor and smooth texture. The tea leaves undergo a meticulous process of steam preservation, locking in the natural freshness and antioxidants that define Germa 66’s commitment to excellence.",
        temp: 176.5,
        brew_time: 3.45,
        price: 19.95,
        image: "https://d2jx2rerrg6sh3.cloudfront.net/images/news/ImageForNews_755721_16914865403343161.jpg"
      )
  
      sub1 = Subscription.new(
        customer: customer1,
        tea: tea1,
        active: true,
        frequency: "swag"
      )

      expect(sub1).not_to be_valid
      expect(sub1.errors[:frequency]).to include("Frequency must be a number.")
    end
  end

  describe 'toggle_active()' do
    it 'toggles a subscriptions active status between true and false' do
      customer1 = Customer.create!(
        first_name: "Monkey",
        last_name: "Luffy",
        email: "mluffy@aol.com",
        street_address: "1738",
        city: "Fosha Village",
        state: "East Blue",
        zip: 17171
      )
  
      tea1 = Tea.create!(
        title: "Germa 66's Green Tea",
        description: "Germa 66, the technologically advanced and militaristic organization from One Piece, is known for its precision and superior craftsmanship, and their green tea is no exception. This carefully crafted blend combines the finest handpicked leaves from the hidden tea gardens of the North Blue, known for their rich, vibrant flavor and smooth texture. The tea leaves undergo a meticulous process of steam preservation, locking in the natural freshness and antioxidants that define Germa 66’s commitment to excellence.",
        temp: 176.5,
        brew_time: 3.45,
        price: 19.95,
        image: "https://d2jx2rerrg6sh3.cloudfront.net/images/news/ImageForNews_755721_16914865403343161.jpg"
      )
  
      sub1 = Subscription.create!(
        customer: customer1,
        tea: tea1,
        active: true,
        frequency: 6
      )

      expect(sub1[:active]).to eq(true)

      sub1.toggle_active

      expect(sub1[:active]).to eq(false)

      sub1.toggle_active

      expect(sub1[:active]).to eq(true)
    end
  end
end