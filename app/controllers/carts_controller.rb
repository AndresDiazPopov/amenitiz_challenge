class CartsController < ApplicationController

  def show
    @carts_products = @cart.carts_products
    @total_price = ::Carts::GetTotalPrice.execute(carts_products: @carts_products)
    @total_discount = ::Carts::GetTotalDiscount.execute(carts_products: @carts_products)
  end

  def add_product
    cart = ::Carts::AddAndRemoveProduct.execute(product_id: params[:id], quantity: params[:quantity], cart: @cart)
    total_price = ::Carts::GetTotalPrice.execute(carts_products: cart.carts_products)
    total_discount = ::Carts::GetTotalDiscount.execute(carts_products: cart.carts_products)

    number_products_cart = cart.carts_products.sum(:quantity)
    respond_to do |format|
      format.turbo_stream do
        if params[:product_added_from_cart] == 'true'
          render turbo_stream: [
            turbo_stream.replace("number_products_cart", partial: 'carts/number_products_cart',
                                 locals: { number_products_cart: number_products_cart,
                                           open_modal: false}),
            turbo_stream.replace("products_cart_modal", partial: 'carts/products_cart_modal',
                                 locals: { carts_products: cart.carts_products,
                                           total_price: total_price,
                                           total_discount: total_discount, open_modal: false})
          ]
        else
          render turbo_stream: turbo_stream.replace("number_products_cart", partial: 'carts/number_products_cart',
                                 locals: { number_products_cart: number_products_cart,
                                           open_modal: false})
        end
      end
    end

  end

end
