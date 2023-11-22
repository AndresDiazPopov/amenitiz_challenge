class ApplicationController < ActionController::Base
  before_action :initialize_cart

  def initialize_cart
    @cart = ::Carts::Initialize.execute(cart_id: session[:cart_id], session: session)
  end

end
