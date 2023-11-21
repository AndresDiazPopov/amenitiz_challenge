module Carts
  class GetTotalPrice < BaseService

    def initialize(carts_products:)
      @carts_products = carts_products
    end

    def execute
      total_price = 0

      @carts_products.each do |cart_product|
        product = cart_product.product
        total_price += cart_product.quantity * product.price
      end

      total_price

    end
  end
end