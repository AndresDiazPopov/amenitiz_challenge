module Carts
  class Initialize < BaseService

    def initialize(cart_id:, session:)
      @cart_id, @session = cart_id, session
    end

    def execute
      cart ||= Cart.find_by(id: @cart_id)
      if cart.nil?
        cart = Cart.create
        @session[:cart_id] = cart.id
      end
      cart
    end

  end
end