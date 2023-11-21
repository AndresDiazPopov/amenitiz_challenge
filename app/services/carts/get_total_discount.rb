module Carts
  class GetTotalDiscount < BaseService

    def initialize(carts_products:)
      @carts_products = carts_products
    end

    def execute
      total_discount = 0
      @carts_products.each do |cart_product|
        if cart_product.has_offers?
          product_discount = ::Carts::GetProductDiscount.execute(cart_product: cart_product)
          total_discount += product_discount
        end
      end

      total_discount
    end

  end
end