require 'rails_helper'

RSpec.describe Product, type: :model do

  it 'is valid with valid attributes' do
    product = build(:product)
    expect(product).to be_valid
  end

  it 'is invalid when the name is null' do
    product = build(:product, name: nil)
    expect(product).to be_invalid
  end

  it 'is invalid when the code is null' do
    product = build(:product, code: nil)
    expect(product).to be_invalid
  end

  it 'is invalid when the price is null' do
    product = build(:product, price: nil)
    expect(product).to be_invalid
  end

  context 'when the code exists' do

    before(:each) do
      @product = create(:product)
    end

    it 'does not allow a product with a duplicate code' do
      product = build(:product, code: @product.code)
      expect(product).to be_invalid
    end

  end

end
