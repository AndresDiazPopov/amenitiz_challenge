class CartsProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def get_product_price_with_discount
    (get_product_price - ::Carts::GetProductDiscount.execute(cart_product: self)).round(2)
  end

  def get_product_price
    (self.product.price * self.quantity).round(2)
  end

  def show_product_price?
    get_product_price != get_product_price_with_discount
  end

  def has_offers?
    self.product.offers.where(discount_type: ::Offer::DISCOUNT_TYPES).any?
  end


end
