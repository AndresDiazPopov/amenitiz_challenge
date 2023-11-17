class Product < ApplicationRecord
  validates :name, :price, presence: true
  validates :code, presence: true, uniqueness: true
end
