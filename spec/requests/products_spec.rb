require 'rails_helper'

RSpec.describe 'Products', type: :request do
  before do
    @products = create_list(:product, 10)
    get root_path
  end

  it 'renders list of products' do
    expect(response).to be_successful
    expect(response.body).to have_selector('.products', count: 1)
    expect(response.body).to have_selector('.product', count: 10)
  end

  it 'renders list of products with correct content' do
    @products.each do |product|
      expect(response).to be_successful
      expect(response.body).to have_selector(".product-#{product.id}") do |product_element|
        expect(product_element).to have_selector('.name-product', text: product.name)
        expect(product_element).to have_selector('.price', text: product.price.to_s)
        expect(product_element).to have_selector('.money-symbol', text: '€')
      end
    end
  end
end
