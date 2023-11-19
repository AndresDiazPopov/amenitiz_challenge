class Product < ApplicationRecord

  has_many :carts_products
  has_many :products, through: :carts_products

  validates :name, :price, presence: true
  validates :code, presence: true, uniqueness: true

end
