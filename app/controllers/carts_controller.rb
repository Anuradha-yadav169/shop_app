class CartsController < ApplicationController
  def index
    binding.pry
    @carts = Cart.all
    # @carts = Cart.products.all
  end

  def show
    @cart = @current_cart
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end
end
