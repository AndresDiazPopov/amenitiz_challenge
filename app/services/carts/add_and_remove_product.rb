module Carts
  class AddAndRemoveProduct < BaseService

    def initialize(product_id:, quantity:, cart:)
      @product_id, @quantity, @cart = product_id, quantity, cart
    end

    def execute
      @product = Product.find_by(id: @product_id)
      cart_product = @cart.carts_products.find_by(product_id: @product.id)
      if product_added_from_cart?
        converted_quantity = @quantity.to_i
        if cart_product && converted_quantity > 0
          cart_product.update(quantity: converted_quantity)
        elsif converted_quantity <= 0
          cart_product.destroy
        else
          @cart.carts_products.create(product: @product, quantity: converted_quantity)
        end
      else
        if cart_product
          cart_product.update(quantity: cart_product.quantity + 1)
        else
          @cart.carts_products.create(product: @product, quantity: 1)
        end
      end

      @cart

    end

    private

    def product_added_from_cart?
      !@quantity.nil?
    end

  end
end