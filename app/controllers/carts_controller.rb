class CartsController < ApplicationController
  def index
    @cart = Cart.all
  end

  def add_item
    if
  end

  def show
    @cart = current_cart.cart_items
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  private
  def cart_params
    params.require(:).permit(:name,:price,:description,)
  end
end
