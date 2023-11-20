Rails.application.routes.draw do

  root "products#index"
  get 'carts/show'
  post 'carts/add_product'

end
