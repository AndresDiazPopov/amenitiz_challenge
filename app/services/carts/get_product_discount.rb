module Carts
  class GetProductDiscount < BaseService

    def initialize(cart_product:)
      @cart_product = cart_product
    end

    def execute
      product_discount = 0

      if @cart_product.product.offers.exists?(discount_type: "BOGO")
        if @cart_product.quantity > 1
          quantity_pairs = @cart_product.quantity / 2
          product_discount += quantity_pairs * @cart_product.product.price
        end
      end

      if @cart_product.product.offers.exists?(discount_type: "BULK") && @cart_product.quantity >= 3
        bulk_offer = Offer.find_by(discount_type: "BULK")
        product_discount += @cart_product.quantity * bulk_offer.discount_amount
      end

      if @cart_product.product.offers.exists?(discount_type: "PRODUCT_ADDICT") && @cart_product.quantity >= 3
        product_addict_offer = Offer.find_by(discount_type: "PRODUCT_ADDICT")
        final_price = @cart_product.quantity * @cart_product.product.price * product_addict_offer.discount_amount
        product_discount += (@cart_product.quantity * @cart_product.product.price) - final_price
      end

      product_discount
    end
    
  end
end