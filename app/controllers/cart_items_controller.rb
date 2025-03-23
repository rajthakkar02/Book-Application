class CartItemsController < ApplicationController
  before_action :set_current_cart, only: %i[create destroy update]

  def create
    book = BookSeller.find_by(book_id: params[:book_id])
    cart_item = @current_cart.cart_items.find_by(book_seller_id: book.id)
    if cart_item.present?
      cart_item.update(quantity: cart_item.quantity + 1)
      book.update(quantity: book.quantity - 1)
      flash[:notice] = "Book added to your cart!"
      redirect_to cart_path
    else
      @current_cart.cart_items.create(book_seller_id: book.id, quantity: 1)
      book.update(quantity: book.quantity - 1)
      flash[:notice] = "Book added to your cart!"
      redirect_to cart_path
    end
  end

  def destroy
    book_item = @current_cart.cart_items.find_by(id: params[:id])
    book = book_item.book_seller
    book.update(quantity: book.quantity + book_item.quantity)
    book_item.destroy
    flash[:notice] = "Cart Item deleted successfully"
    redirect_to root_path
  end

  def update
    cart_item = @current_cart.cart_items.find_by(id: params[:id])

    if cart_item.present?
      book = cart_item.book_seller
      book.update(quantity: book.quantity = book.quantity - (params[:quantity].to_i - cart_item.quantity))
      cart_item.update(quantity: params[:quantity].to_i)
      flash[:notice] = "Cart Item update successfully"
    else
      flash[:alert] = "Cart item not found"
    end
    redirect_to cart_path
  end

  private

  def set_current_cart
    if cookies[:current_cart_id]
      @current_cart = Cart.find_by(secret_id: cookies[:current_cart_id])
    else
      @current_cart = Cart.create
      cookies[:current_cart_id] = @current_cart.secret_id
    end
  end
end
