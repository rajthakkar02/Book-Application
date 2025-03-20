class CartsController < ApplicationController
  before_action :set_current_cart, only: %i[show destroy]

  def show
  end

  def destroy
    @current_cart.cart_items.each do |item|
      book_seller = item.book_seller
      if book_seller
        book_seller.quantity += item.quantity # Restocking the quantity
        book_seller.save
      end
    end
    @current_cart.destroy if @current_cart.secret_id == cookies[:current_cart_id]
    cookies.delete(:current_cart_id)
    redirect_to root_path, notice: "Your cart has been empty."
  end

  private

  def total_price
    @current_cart.cart_items.book_seller.seller_price * @current_cart.cart_items.quantity
  end

  def set_current_cart
    if cookies[:current_cart_id]
      @current_cart = Cart.find_by(secret_id: cookies[:current_cart_id])
    else
      @current_cart = Cart.create
      cookies[:current_cart_id] = @current_cart.secret_id
    end
  end
end
