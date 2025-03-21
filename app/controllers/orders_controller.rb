class OrdersController < ApplicationController
  before_action :set_current_cart, only: %i[create]
  before_action :authenticate_user!, only: %i[create index show destroy]

  def index
    @orders = Order.where(current_user: current_user.id) if current_user.role == "customer"
    if current_user.role == "seller"
      @orders = Order.joins(order_items: { book_seller: :user })
        .where(users: { id: current_user.id })
        .distinct
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def create
    address = Address.find(params[:address_id])
    order = Order.new(address_id: address.id, current_user: current_user.id, total_price: @current_cart.total_price, order_status: 0)
    @current_cart.cart_items.each do |cart_item|
      order.order_items.build(
        book_seller: cart_item.book_seller,
        quantity: cart_item.quantity,
      )
    end

    if order.save
      @current_cart.cart_items.destroy_all
      flash[:notice] = "Your order has been placed successfully."
      redirect_to orders_path
    else
      flash[:alert] = "Failed to place the order."
      redirect_to cart_path
    end
  end

  def destroy
    order = Order.find(params[:id])
    order.order_items.each do |item|
      book_seller = item.book_seller
      if book_seller
        book_seller.quantity += item.quantity
        book_seller.save
      end
    end
    order.order_items.destroy_all
    order.destroy
    flash[:alert] = "Your order has been canceled."
    redirect_to root_path
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to orders_path, notice: "Order status updated successfully!"
    else
      redirect_to orders_path, alert: "Failed to update order status."
    end
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
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
