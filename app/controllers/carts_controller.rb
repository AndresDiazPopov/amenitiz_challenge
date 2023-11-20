class CartsController < ApplicationController

  def show
  end

  def add_product
    cart = ::Carts::AddAndRemoveProduct.execute(product_id: params[:id], quantity: params[:quantity], cart: @cart)
    number_products_cart = cart.carts_products.sum(:quantity)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("number_products_cart",
                                                  partial: 'carts/number_products_cart',
                                                  locals: { number_products_cart: number_products_cart})
      end
    end

  end

end
