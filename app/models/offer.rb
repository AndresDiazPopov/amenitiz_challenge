class Offer < ApplicationRecord
  has_many :offers_products
  has_many :products, through: :offers_products

  DISCOUNT_TYPES = %w[BOGO BULK PRODUCT_ADDICT]
end
