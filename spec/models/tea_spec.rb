require 'rails_helper'

RSpec.describe Tea, type: :model do
  describe 'associations' do
    it {should have_many(:customers).through(:subscriptions)}
    it {should have_many(:subscriptions)}
  end

  describe 'validations' do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:temp)}
    it {should validate_presence_of(:brew_time)}
    it {should validate_presence_of(:price)}
    it {should validate_presence_of(:image)}

    it 'validates the numericality of temp' do
      tea = Tea.new(
        title: "Germa 66's Green Tea",
        description: "Germa 66, the technologically advanced and militaristic organization from One Piece, is known for its precision and superior craftsmanship, and their green tea is no exception. This carefully crafted blend combines the finest handpicked leaves from the hidden tea gardens of the North Blue, known for their rich, vibrant flavor and smooth texture. The tea leaves undergo a meticulous process of steam preservation, locking in the natural freshness and antioxidants that define Germa 66’s commitment to excellence.",
        temp: "swag",
        brew_time: 3.45,
        price: 19.95,
        image: "https://d2jx2rerrg6sh3.cloudfront.net/images/news/ImageForNews_755721_16914865403343161.jpg"
      )

      expect(tea).not_to be_valid
      expect(tea.errors[:temp]).to include("Temp must be a number.")
    end

    it 'validates the numericality of brew_time' do
      tea = Tea.new(
        title: "Germa 66's Green Tea",
        description: "Germa 66, the technologically advanced and militaristic organization from One Piece, is known for its precision and superior craftsmanship, and their green tea is no exception. This carefully crafted blend combines the finest handpicked leaves from the hidden tea gardens of the North Blue, known for their rich, vibrant flavor and smooth texture. The tea leaves undergo a meticulous process of steam preservation, locking in the natural freshness and antioxidants that define Germa 66’s commitment to excellence.",
        temp: 176.5,
        brew_time: "swag",
        price: 19.95,
        image: "https://d2jx2rerrg6sh3.cloudfront.net/images/news/ImageForNews_755721_16914865403343161.jpg"
      )

      expect(tea).not_to be_valid
      expect(tea.errors[:brew_time]).to include("Brew_time must be a number.")
    end

    it 'validates the numericality of price' do
      tea = Tea.new(
        title: "Germa 66's Green Tea",
        description: "Germa 66, the technologically advanced and militaristic organization from One Piece, is known for its precision and superior craftsmanship, and their green tea is no exception. This carefully crafted blend combines the finest handpicked leaves from the hidden tea gardens of the North Blue, known for their rich, vibrant flavor and smooth texture. The tea leaves undergo a meticulous process of steam preservation, locking in the natural freshness and antioxidants that define Germa 66’s commitment to excellence.",
        temp: 176.5,
        brew_time: 3.45,
        price: "swag",
        image: "https://d2jx2rerrg6sh3.cloudfront.net/images/news/ImageForNews_755721_16914865403343161.jpg"
      )

      expect(tea).not_to be_valid
      expect(tea.errors[:price]).to include("Price must be a number.")
    end
  end
end
