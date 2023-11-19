Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"

=begin
  resources :carts do
    post 'add_product', on: :member
    post 'remove_product', on: :member
  end
=end

  post 'carts/add_product'
  post 'carts/remove_product'

end
