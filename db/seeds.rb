product_1 = Product.find_or_create_by(code: 'GR1') do |product|
  product.name ='Green Tea'
  product.price = 3.11
end
product_2 = Product.find_or_create_by(code: 'SR1') do |product|
  product.name = 'Strawberries'
  product.price = 5.00
end
product_3 = Product.find_or_create_by(code: 'CF1') do |product|
  product.name = 'Coffee'
  product.price = 11.23
end
Product.find_or_create_by(code: 'AP1') do |product|
  product.name = 'Apples'
  product.price = 2.50
end
Product.find_or_create_by(code: 'OI1') do |product|
  product.name = 'Oil'
  product.price = 4.75
end
Product.find_or_create_by(code: 'EG1') do |product|
  product.name = 'Eggs'
  product.price = 1.99
end
Product.find_or_create_by(code: 'BR1') do |product|
  product.name = 'Bread'
  product.price = 1.25
end
Product.find_or_create_by(code: 'CH1') do |product|
  product.name = 'Chicken'
  product.price = 6.50
end
Product.find_or_create_by(code: 'CO1') do |product|
  product.name = 'Cookies'
  product.price = 2.99
end
Product.find_or_create_by(code: 'PO1') do |product|
  product.name = 'Potatoes'
  product.price = 1.75
end
Product.find_or_create_by(code: 'PB1') do |product|
  product.name = 'Peanut butter'
  product.price = 1.85
end
Product.find_or_create_by(code: 'PZ1') do |product|
  product.name = 'Pizza'
  product.price = 3.75
end

offer_1 = Offer.find_or_create_by(discount_type: "BOGO") do |offer|
  offer.title = "Buy One, Get One Free"
  offer.discount_amount =  1
end
offer_2 = Offer.find_or_create_by(discount_type: "BULK") do |offer|
  offer.title = "Bulk Purchase"
  offer.discount_amount =  0.50
end
offer_3 = Offer.find_or_create_by(discount_type: "PRODUCT_ADDICT") do |offer|
  offer.title = "Product Addict Offer"
  offer.discount_amount =  2/3.to_d
end

product_1.offers << offer_1
product_2.offers << offer_2
product_3.offers << offer_3


